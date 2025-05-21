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
    themeFile = "cherry-midnight";
    settings = {
      include = "~/.config/kitty/theme.conf";
      background_opacity = "0.5";
      enable_audio_bell = false;
      update_check_interval = 0;
      confirm_os_window_close = 0;
      cursor_trail = 3;
      cursor_trail_decay = "0.1 0.4";
      cursor_trail_start_threshold = 1;
    };
  };
}
