{ pkgs, ... }:

{
  programs.zed-editor = {
    enable = true;
    package = pkgs.unstable.zed-editor;

    extensions = [
      "html"
      "elixir"
      "catppuccin-blur"
      "symbols"
      "nix"
      "aura-theme"
      "charmed-icons"
      "vue"
    ];

    userSettings = {
      session = {
        trust_all_worktrees = true;
      };
      base_keymap = "VSCode";
      debugger = {
        dock = "bottom";
      };
      agent = {
        dock = "left";
      };
      agent_servers = {
        "Claude Code" = {
          type = "custom";
          command = "claude-agent-acp";
        };
      };
      edit_predictions = {
        mode = "subtle";
        copilot = {
          proxy = null;
          proxy_no_verify = null;
          enterprise_uri = null;
        };
        enabled_in_text_threads = false;
      };
      icon_theme = "Symbols Icon Theme";
      theme = "Catppuccin Espresso (Blur) [Light]";
      buffer_font_family = "JetBrainsMono Nerd Font";
      buffer_font_size = 16;
      soft_wrap = "editor_width";
      ui_font_size = 17;
      diagnostics_max_severity = "hint";
      inlay_hints = {
        show_type_hints = true;
        show_parameter_hints = true;
        show_other_hints = true;
        show_background = false;
        edit_debounce_ms = 700;
        scroll_debounce_ms = 50;
        toggle_on_modifiers_press = {
          control = false;
        };
        show_value_hints = true;
      };
      status_bar = {
        active_language_button = true;
        cursor_position_button = false;
      };
      tab_bar = {
        show = true;
        show_nav_history_buttons = false;
        show_tab_bar_buttons = false;
      };
      tab_size = 2;
      tabs = {
        close_position = "right";
        file_icons = true;
        git_status = true;
        activate_on_close = "neighbour";
        show_close_button = "hover";
        show_diagnostics = "all";
      };
      title_bar = {
        show_branch_icon = true;
        show_branch_name = false;
        show_project_items = false;
        show_onboarding_banner = false;
        show_user_picture = false;
        show_sign_in = true;
        show_menus = false;
      };
      toolbar = {
        breadcrumbs = true;
        quick_actions = true;
        selections_menu = true;
        agent_review = true;
      };
      minimap = {
        show = "always";
        thumb = "always";
        thumb_border = "left_open";
        current_line_highlight = null;
        display_in = "all_editors";
      };
      git = {
        git_gutter = "tracked_files";
        inline_blame = {
          enabled = true;
          show_commit_summary = true;
          padding = 7;
        };
        branch_picker = {
          show_author_name = true;
        };
        hunk_style = "unstaged_hollow";
      };
      cursor_blink = true;
      show_whitespaces = "none";
      indent_guides = {
        enabled = false;
        line_width = 1;
        active_line_width = 0;
        coloring = "indent_aware";
        background_coloring = "disabled";
      };
      project_panel = {
        button = false;
        default_width = 240;
        folder_icons = true;
        hide_root = true;
        indent_size = 20;
        auto_fold_dirs = false;
        drag_and_drop = true;
        git_status = true;
        auto_reveal_entries = true;
        entry_spacing = "comfortable";
        starts_open = true;
        scrollbar = {
          show = null;
        };
        indent_guides = {
          show = "always";
        };
      };
      collaboration_panel = {
        button = false;
      };
      outline_panel = {
        button = false;
        default_width = 300;
        file_icons = true;
        folder_icons = true;
        git_status = true;
        indent_size = 20;
        auto_reveal_entries = true;
        auto_fold_dirs = true;
        indent_guides = {
          show = "always";
        };
        scrollbar = {
          show = null;
        };
      };
      terminal = {
        alternate_scroll = "off";
        blinking = "on";
        copy_on_select = false;
        keep_selection_on_copy = false;
        dock = "bottom";
        default_width = 640;
        default_height = 320;
        env = {
          FIG_NEW_SESSION = "1";
          Q_NEW_SESSION = "1";
        };
        detect_venv = {
          on = {
            directories = [
              ".env"
              "env"
              ".venv"
              "venv"
            ];
            activate_script = "default";
          };
        };
        font_size = 15;
        line_height = "comfortable";
        minimum_contrast = 45;
        button = false;
        shell = "system";
        toolbar = {
          breadcrumbs = false;
        };
        working_directory = "current_project_directory";
        scrollbar = {
          show = null;
        };
      };
      scrollbar = {
        show = "never";
        cursors = true;
      };
      file_types = {
        css = [ "*.css" ];
        json = [ ".prettierrc" ];
        dotenv = [ ".env.*" ];
      };
      file_scan_exclusions = [
        "_build"
        ".nix-hex"
        ".nix-mix"
        ".tests_outputs"
        "deps"
        "node_modules"
        ".husky"
        ".yarn"
        "**/__pycache__"
        ".claude"
        ".git"
        "instance"
        ".pytest_cache"
        ".elixir_ls"
        ".expert"
        ".lexical"
        "dist"
      ];
      languages = {
        Elixir = {
          language_servers = [ "expert" ];
        };
        EEx = {
          language_servers = [ "expert" ];
        };
        HEEx = {
          language_servers = [ "expert" ];
        };
      };
      lsp = {
        expert = {
          settings = {
            dialyzerEnabled = false;
          };
          binary = {
            path = "expert";
            arguments = [ "--stdio" ];
          };
        };
        "vue-language-server" = {
          binary = {
            path = "vue-language-server";
            arguments = [ "--stdio" ];
          };
        };
        "package-version-server" = {
          initialization_options = {
            disabled = true;
          };
        };
      };
      node = {
        path = "node";
        npm_path = "npm";
      };
    };

    userKeymaps = [
      {
        context = "ProjectPanel";
        bindings = {
          "ctrl-alt-e" = "project_panel::CollapseAllEntries";
        };
      }
    ];
  };
}
