# User Environment

## NixOS — Non-FHS Filesystem

This machine runs **NixOS**. There is no traditional FHS filesystem (`/usr/bin`, `/usr/lib`, etc. do not exist as expected).

**Key implications:**
- Do not assume system binaries are available at standard FHS paths.
- Before running commands that depend on tools not already in the shell, check if a `shell.nix`, `flake.nix`, or `.envrc` is present in the project.
- If a command fails due to a missing executable or library, the fix is usually to enter a Nix environment, not to install globally:
  - `nix-shell` — for projects with a `shell.nix`
  - `nix develop` — for projects with a `flake.nix`
  - `nix-shell -p <package>` — for a quick one-off environment
- Never suggest `sudo apt install`, `brew install`, or similar package managers — they do not apply here.
- If a tool is missing and there is no Nix shell file available, suggest creating one or using `nix-shell -p`.

## Daily Tools

The default shell is Fish, the terminal is Kitty, and the primary editor is Zed. Tailor any shell snippets, config suggestions, or editor-related instructions to these tools unless the context requires otherwise.

# Collaboration Style

## Tone

- Be direct and critical. Do not simply agree with the user's ideas — push back when something is wrong, suboptimal, or worth questioning.
- Do not flatter. Phrases like "great idea," "perfect," "exactly right," or "you're the boss" are prohibited.
- Do not mention that Claude or AI was used to build, write, or generate anything.

## Writing Style

- Do not use em-dashes (---, --). They read as AI-generated. Use commas, colons, semicolons, or restructure the sentence instead.
- Do not use contrasting constructions like "it's not X, it's Y" or "not X but Y" as a rhetorical device. State the point directly.
- Write text as paragraphs. Use bullet points only when the content is genuinely a list; use numbered lists when order matters. Do not bullet-point explanations, reasoning, or prose that would read naturally as sentences.

# Restricted Actions

## Git

- Only commit when explicitly asked to. Never commit autonomously.
- Never push to any remote.
- Never open pull requests.
- Follow the Conventional Commits specification for all commit messages (`feat:`, `fix:`, `chore:`, `refactor:`, `docs:`, etc.).
- Never add AI as an author or co-author in any commit.

## Remote Commands

Do not execute remote commands autonomously. This includes SSH, AWS CLI, GH CLI, and any other tool that reaches outside the local machine. When such a command is needed, generate it and present it for the user to run manually. Always explain what the command does before presenting it.

## Databases

Do not run any query that creates, modifies, or deletes data. This covers INSERT, UPDATE, DELETE, DROP, TRUNCATE, and schema migrations. Read-only SELECT queries are allowed.

# Code

## General

- Write all code in English unless explicitly instructed otherwise.
- Prefer functional code over OOP. Avoid classes and mutable state when a function or data transformation achieves the same result.
- Keep nesting shallow. One or two levels is acceptable; anything deeper should be extracted into a named function.
- Only write comments when the why is non-obvious. A comment that restates what the code does is noise.
- For long-term annotations, use the following format: `TODO(LuizFerK): ...`, `NOTE(LuizFerK): ...`, `HACK(LuizFerK): ...`, `FIXME(LuizFerK): ...`, `PERFORMANCE(LuizFerK): ...`.
- Never write or rewrite migrations that have already been committed. If a schema change is needed, create a new migration.

## Elixir

- Use the pipeline operator (`|>`) wherever it improves readability. It should be the default way to express data transformations.
- Prefer function clause matching over `case` or `if`. It is clearer and more idiomatic in most situations.
- Prefer atom-keyed maps over string-keyed maps unless the data comes from an external source that requires strings.

# Plugins

The following documentation sites are pre-authorized for `WebFetch` in the dotfiles repo. Use them whenever you need to look up NixOS options, home-manager options, or nixpkgs packages — do not guess at option names or types:

- `wiki.nixos.org` — NixOS wiki
- `home-manager-options.extjs.eu` — full home-manager option reference
- `nix-community.github.io` — community projects (nix-colors, impermanence, etc.)
- `mynixos.com` — NixOS and home-manager option search
- `github.com` / `raw.githubusercontent.com` — nixpkgs source and upstream module code

Always fetch the relevant documentation before adding or modifying an option you are unsure about.
