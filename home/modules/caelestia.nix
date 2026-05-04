{ inputs, ... }:

{
  imports = [
    inputs.caelestia-shell.homeManagerModules.default
  ];
  programs.caelestia = {
    enable = true;
    systemd = {
      enable = false;
      target = "graphical-session.target";
      environment = [ ];
    };
    settings = {
      appearance.transparency.enabled = true;
      services.useFahrenheit = false;
      notifs.actionOnClick = true;
      general.idle = {
        lockBeforeSleep = false;
        timeouts = [ ];
      };
      bar.status = {
        showBattery = false;
        showWifi = false;
      };
      paths = {
        wallpaperDir = "~/.dotfiles/assets/wallpapers";
        mediaGif = "root:/assets/bongocat.gif";
        sessionGif = "~/.dotfiles/assets/gifs/rainbowcat.gif";
      };
    };
    cli = {
      enable = true;
      settings.theme.enableGtk = false;
    };
  };
  home.file.".face" = {
    source = ../../assets/gifs/smokingcat.gif;
  };
}
