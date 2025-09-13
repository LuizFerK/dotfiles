{ pkgs, ... }:

{
  home.file.".config/Code/User/settings.json" = {
    source = ../../configs/vscode/settings.json;
  };
  home.file.".config/Cursor/User/settings.json" = {
    source = ../../configs/vscode/settings.json;
  };
  programs.vscode.enable = true;
}