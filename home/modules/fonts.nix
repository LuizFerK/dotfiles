{ lib, pkgs, ... }:

{
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    jetbrains-mono
    fira-code
    fira-code-symbols
    material-icons
    material-design-icons
    noto-fonts
    font-awesome
    terminus_font
    fantasque-sans-mono
    papirus-icon-theme
  ] ++ builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);
}
