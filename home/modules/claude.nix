{ pkgs, inputs, ... }:

let
  pluginDirs = [
    "${inputs.claude-plugins-official}/plugins/skill-creator"
    "${inputs.claude-plugins-official}/plugins/frontend-design"
    "${inputs.claude-plugins-official}/plugins/security-guidance"
    "${inputs.impeccable}/plugin"
    "${inputs.claude-plugins-official}/external_plugins/context7"
  ];

  pluginFlags = builtins.concatStringsSep " " (map (d: "--plugin-dir ${d}") pluginDirs);

  claude = pkgs.writeShellScriptBin "claude" ''
    exec ${pkgs.unstable.claude-code}/bin/claude ${pluginFlags} "$@"
  '';

  settings = pkgs.writeText "claude-settings.json" (
    builtins.toJSON {
      permissions.allow = [ ];
      enabledPlugins = { };
      skipAutoPermissionPrompt = true;
      defaultPermissionMode = "auto";
    }
  );
in
{
  home.packages = [
    claude
    pkgs.nodejs
    pkgs.python3
  ];

  home.file.".claude/settings.json".source = settings;
}
