package main

import (
	"bytes"
	"context"
	"fmt"
	"os"
	"os/exec"
	"strconv"
	"strings"
	"time"

	"github.com/charmbracelet/bubbles/spinner"
	tea "github.com/charmbracelet/bubbletea"
	"github.com/charmbracelet/lipgloss"
)

type stepStatus int

const (
	pending stepStatus = iota
	running
	done
	failed
)

type step struct {
	name    string
	args    []string
	status  stepStatus
	elapsed time.Duration
}

type model struct {
	steps      []step
	current    int
	spinner    spinner.Model
	diskBefore int64
	diskAfter  int64
	startedAt  time.Time
	totalTime  time.Duration
	finished   bool
	ctx        context.Context
	cancel     context.CancelFunc
}

type stepDoneMsg struct {
	index   int
	elapsed time.Duration
	err     error
}

type diskMsg struct {
	bytes  int64
	before bool
}

var (
	styleCyan  = lipgloss.NewStyle().Foreground(lipgloss.Color("6"))
	styleGreen = lipgloss.NewStyle().Foreground(lipgloss.Color("2"))
	styleRed   = lipgloss.NewStyle().Foreground(lipgloss.Color("1"))
	styleDim   = lipgloss.NewStyle().Faint(true)
	styleBold  = lipgloss.NewStyle().Bold(true)
)

func diskUsedBytes() int64 {
	out, err := exec.Command("df", "--output=used", "-B1", "/").Output()
	if err != nil {
		return 0
	}
	lines := strings.Split(strings.TrimSpace(string(out)), "\n")
	if len(lines) < 2 {
		return 0
	}
	n, _ := strconv.ParseInt(strings.TrimSpace(lines[1]), 10, 64)
	return n
}

func formatBytes(b int64) string {
	switch {
	case b >= 1_073_741_824:
		return fmt.Sprintf("%.1f GB", float64(b)/1_073_741_824)
	case b >= 1_048_576:
		return fmt.Sprintf("%.1f MB", float64(b)/1_048_576)
	default:
		return fmt.Sprintf("%.0f KB", float64(b)/1_024)
	}
}

func formatDuration(d time.Duration) string {
	s := int(d.Seconds())
	if s < 60 {
		return fmt.Sprintf("%ds", s)
	}
	return fmt.Sprintf("%dm%ds", s/60, s%60)
}

func dockerRunning() bool {
	return exec.Command("docker", "info").Run() == nil
}

func buildSteps() []step {
	steps := []step{
		{name: "nix collect garbage", args: []string{"sudo", "nix-collect-garbage", "-d"}},
		{name: "nix store optimise", args: []string{"sudo", "nix", "store", "optimise"}},
		{name: "vacuum system logs", args: []string{"sudo", "journalctl", "--vacuum-time=14d"}},
	}
	if dockerRunning() {
		steps = append(steps, step{
			name: "docker system prune",
			args: []string{"docker", "system", "prune", "-a", "--volumes", "-f"},
		})
	}
	return steps
}

func newModel() model {
	sp := spinner.New()
	sp.Spinner = spinner.Dot
	sp.Style = styleCyan

	ctx, cancel := context.WithCancel(context.Background())

	return model{
		steps:     buildSteps(),
		current:   -1,
		spinner:   sp,
		startedAt: time.Now(),
		ctx:       ctx,
		cancel:    cancel,
	}
}

func readDisk(before bool) tea.Cmd {
	return func() tea.Msg {
		return diskMsg{bytes: diskUsedBytes(), before: before}
	}
}

func (m model) runStep() tea.Cmd {
	if m.current >= len(m.steps) {
		return readDisk(false)
	}
	s := m.steps[m.current]
	start := time.Now()
	idx := m.current
	return func() tea.Msg {
		cmd := exec.CommandContext(m.ctx, s.args[0], s.args[1:]...)
		var buf bytes.Buffer
		cmd.Stdout = &buf
		cmd.Stderr = &buf
		err := cmd.Run()
		return stepDoneMsg{index: idx, elapsed: time.Since(start), err: err}
	}
}

func (m model) Init() tea.Cmd {
	return tea.Batch(m.spinner.Tick, readDisk(true))
}

func (m model) Update(msg tea.Msg) (tea.Model, tea.Cmd) {
	switch msg := msg.(type) {

	case tea.KeyMsg:
		if msg.Type == tea.KeyCtrlC {
			m.cancel()
			return m, tea.Quit
		}
		if m.finished {
			return m, tea.Quit
		}

	case spinner.TickMsg:
		var cmd tea.Cmd
		m.spinner, cmd = m.spinner.Update(msg)
		return m, cmd

	case diskMsg:
		if msg.before {
			m.diskBefore = msg.bytes
			m.current = 0
			if len(m.steps) > 0 {
				m.steps[0].status = running
			}
			return m, m.runStep()
		}
		m.diskAfter = msg.bytes
		m.totalTime = time.Since(m.startedAt)
		m.finished = true

	case stepDoneMsg:
		m.steps[msg.index].elapsed = msg.elapsed
		if msg.err != nil {
			m.steps[msg.index].status = failed
		} else {
			m.steps[msg.index].status = done
		}
		m.current++
		if m.current < len(m.steps) {
			m.steps[m.current].status = running
		}
		return m, m.runStep()
	}

	return m, nil
}

func (m model) View() string {
	var sb strings.Builder

	sb.WriteString("\n")

	for _, s := range m.steps {
		var icon, name string
		switch s.status {
		case pending:
			icon = styleDim.Render("·")
			name = styleDim.Render(s.name)
		case running:
			icon = m.spinner.View()
			name = styleCyan.Render(s.name)
		case done:
			icon = styleGreen.Render("✔")
			name = s.name
		case failed:
			icon = styleRed.Render("✘")
			name = styleRed.Render(s.name)
		}

		if s.status == done || s.status == failed {
			sb.WriteString(fmt.Sprintf("  %s  %-28s  %s\n", icon, name, styleDim.Render(formatDuration(s.elapsed))))
		} else {
			sb.WriteString(fmt.Sprintf("  %s  %s\n", icon, name))
		}
	}

	if m.current == -1 {
		sb.WriteString("\n  " + styleDim.Render("reading disk usage...") + "\n")
	}

	if m.finished {
		freed := m.diskBefore - m.diskAfter

		sb.WriteString("\n")
		sb.WriteString(styleBold.Render("  Summary") + "\n\n")
		sb.WriteString(fmt.Sprintf("  %-14s %s\n", "Total time:", formatDuration(m.totalTime)))

		if freed > 0 {
			sb.WriteString(fmt.Sprintf("  %-14s %s\n", "Freed:", styleGreen.Render(formatBytes(freed))))
		} else {
			sb.WriteString(fmt.Sprintf("  %-14s %s\n", "Freed:", styleDim.Render("nothing to free")))
		}

		sb.WriteString("\n  " + styleDim.Render("press any key to exit") + "\n")
	}

	return sb.String()
}

func main() {
	p := tea.NewProgram(newModel())
	if _, err := p.Run(); err != nil {
		fmt.Fprintln(os.Stderr, err)
		os.Exit(1)
	}
}
