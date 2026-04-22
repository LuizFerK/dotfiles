{
  xdg.desktopEntries = {
    vesktop = {
      categories = [ "Application" ];
      exec = "vesktop -enable-features=UseOzonePlatform -ozone-platform=wayland";
      genericName = "Vesktop";
      icon = "vesktop";
      name = "Vesktop";
      terminal = false;
      type = "Application";
    };

    puffin = {
      name = "Puffin";
      comment = "PostgreSQL GUI";
      exec = "nix run /home/luiz/apps/puffin";
      icon = "/home/luiz/apps/puffin/public/logo.png";
      categories = [
        "Development"
        "Utility"
      ];
      terminal = false;
      type = "Application";
    };
  };
}
