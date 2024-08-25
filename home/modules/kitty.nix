{ pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    shellIntegration.enableFishIntegration = true;
    font = {
      name = "FiraCode Nerd Font Mono";
      package = pkgs.jetbrains-mono;
      size = 12;
    };
    settings = {
      background_opacity = "0.5";
      enable_audio_bell = false;
      update_check_interval = 0;
      confirm_os_window_close = 0;
      include = "~/.config/kitty/theme.conf";
    };
  };
}
