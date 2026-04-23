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
