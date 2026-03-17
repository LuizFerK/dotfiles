{ pkgs, ... }:

{
  home.file.".config/Code/User/settings.json" = {
    source = ../../configs/vscode/settings.json;
  };
  home.file.".config/Antigravity/User/settings.json" = {
    source = ../../configs/vscode/settings.json;
  };
  programs.vscode.enable = true;
}