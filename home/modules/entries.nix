{ inputs, pkgs, ...}:

{
  xdg.desktopEntries = {
    wallpick = {
      categories = ["Application"];
      exec = "sh .config/wallpicker/wallpicker.sh";
      genericName = "Wallpaper picker";
      icon = "discord";
      name = "Wallpicker";
      terminal = false;
      type = "Application";
    };
  };
}