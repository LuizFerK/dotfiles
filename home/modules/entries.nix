{ inputs, pkgs, ...}:

{
  xdg.desktopEntries = {
    wallpick = {
      categories = ["Application"];
      exec = "sh .config/wallpicker/wallpicker.sh";
      genericName = "Wallpaper picker";
      icon = "/home/luiz/.local/share/icons/Reversal-black-dark/categories/32/applications-graphics.svg";
      name = "Wallpicker";
      terminal = false;
      type = "Application";
    };
  };
}