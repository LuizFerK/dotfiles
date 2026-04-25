{
  xdg.desktopEntries.puffin = {
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
}
