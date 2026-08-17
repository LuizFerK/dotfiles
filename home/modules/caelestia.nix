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
      bar.statusIcons = [
        { id = "lockStatus"; enabled = true; }
        { id = "audio"; enabled = false; }
        { id = "microphone"; enabled = false; }
        { id = "kbLayout"; enabled = false; }
        { id = "network"; enabled = false; }
        { id = "bluetooth"; enabled = true; }
        { id = "battery"; enabled = false; }
      ];
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
