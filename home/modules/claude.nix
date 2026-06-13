{ pkgs, inputs, ... }:

let
  # Extract the WRAPPER heredoc from headroom's install.sh using a file-based
  # awk script to avoid shell quoting issues with '<<' in inline expressions.
  # /WRAPPER'$/ matches the opening `cat <<'WRAPPER'` line.
  # /^WRAPPER$/ matches the bare closing delimiter at column 0.
  extractAwk = pkgs.writeText "headroom-extract.awk" ''
    /WRAPPER'$/ { found = 1; next }
    found && /^WRAPPER$/ { exit }
    found { print }
  '';

  # Reproduce what install.sh's write_wrapper() produces: shebang, image
  # variable, then the full WRAPPER heredoc content.
  headroom = pkgs.runCommand "headroom" { } ''
    mkdir -p $out/bin
    target="$out/bin/headroom"

    printf '#!%s\n\n' "${pkgs.bash}/bin/bash" > "$target"
    printf 'HEADROOM_IMAGE_DEFAULT=%s\n\n' "ghcr.io/chopratejas/headroom:latest" >> "$target"

    ${pkgs.gawk}/bin/awk -f ${extractAwk} \
      "${inputs.headroom}/scripts/install.sh" >> "$target"

    chmod +x "$target"
  '';

  pluginDirs = [
    "${inputs.caveman}"
    "${inputs.headroom}/plugins/headroom-agent-hooks"
    "${inputs.claude-plugins-official}/plugins/skill-creator"
    "${inputs.claude-plugins-official}/plugins/frontend-design"
    "${inputs.claude-plugins-official}/plugins/security-guidance"
    "${inputs.impeccable}/plugin"
    "${inputs.claude-plugins-official}/external_plugins/context7"
  ];

  pluginFlags = builtins.concatStringsSep " " (map (d: "--plugin-dir ${d}") pluginDirs);

  # Run every claude session through the headroom Docker proxy for context
  # compression. HEADROOM_WRAPPED breaks the recursion: headroom wrap claude
  # calls claude, which would otherwise invoke headroom again infinitely.
  claude = pkgs.writeShellScriptBin "claude" ''
    if [ -z "''${HEADROOM_WRAPPED:-}" ]; then
      export HEADROOM_WRAPPED=1
      # Reuse an existing headroom container if one is already healthy on port 8787.
      # headroom wrap always spawns a new per-PID container; if a previous session
      # was killed (SIGKILL bypasses the EXIT trap), the old container stays up and
      # blocks the new docker run with "port already allocated".
      if docker ps --filter "name=headroom-proxy-8787" --filter "status=running" -q 2>/dev/null | grep -q .; then
        export ANTHROPIC_BASE_URL="http://127.0.0.1:8787"
        exec ${pkgs.unstable.claude-code}/bin/claude ${pluginFlags} "$@"
      else
        exec ${headroom}/bin/headroom wrap claude -- ${pluginFlags} "$@"
      fi
    fi
    exec ${pkgs.unstable.claude-code}/bin/claude ${pluginFlags} "$@"
  '';

  # Stable wrapper so settings.json can reference by name without a nix store hash.
  caveman-statusline = pkgs.writeShellScriptBin "caveman-statusline" ''
    exec "${inputs.caveman}/src/hooks/caveman-statusline.sh"
  '';

  settings = pkgs.writeText "claude-settings.json" (
    builtins.toJSON {
      permissions.allow = [ ];
      enabledPlugins = { };
      skipAutoPermissionPrompt = true;
      defaultPermissionMode = "auto";
      statusLine = {
        type = "command";
        command = "caveman-statusline";
      };
    }
  );
in
{
  home.packages = [
    claude
    headroom
    caveman-statusline
    pkgs.nodejs
    pkgs.python3
  ];

  home.file.".claude/settings.json".source = settings;
}
