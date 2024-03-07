{ pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    shellIntegration.enableFishIntegration = true;
    font = {
      name = "JetBrainsMono Nerd Font";
      package = pkgs.jetbrains-mono;
      size = 10;
    };
    theme = "Adapta Nokto Maia";
    settings = {
      background_opacity = "0.75";
      enable_audio_bell = false;
      update_check_interval = 0;
      confirm_os_window_close = 0;
    };
  };
}