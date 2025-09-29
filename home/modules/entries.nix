{ inputs, pkgs, ...}:

{
  xdg.desktopEntries = {
    vesktop = {
      categories = ["Application"];
      exec = "vesktop -enable-features=UseOzonePlatform -ozone-platform=wayland";
      genericName = "Vesktop";
      icon = "vesktop";
      name = "Vesktop";
      terminal = false;
      type = "Application";
    };
  };
}