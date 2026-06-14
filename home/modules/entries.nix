_:

{
  xdg.desktopEntries = {
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

    headroom = {
      name = "Headroom";
      exec = "xdg-open http://127.0.0.1:8787/dashboard";
      icon = "/home/luiz/.dotfiles/assets/icons/claude.png";
      terminal = false;
      categories = [ "Network" ];
    };

    nixpkgs = {
      name = "Nixpkgs";
      exec = "xdg-open https://search.nixos.org/packages";
      icon = "/home/luiz/.dotfiles/assets/icons/nix.png";
      terminal = false;
      categories = [ "Network" ];
    };

    rbov-git = {
      name = "Rbov Git";
      exec = "xdg-open https://github.com/GranterOrg/radarbov-web/tree/dev";
      icon = "/home/luiz/.dotfiles/assets/icons/rbov.png";
      terminal = false;
      categories = [ "Development" ];
    };

    rbov-pulls = {
      name = "Rbov Pulls";
      exec = "xdg-open https://github.com/GranterOrg/radarbov-web/pulls";
      icon = "/home/luiz/.dotfiles/assets/icons/rbov.png";
      terminal = false;
      categories = [ "Development" ];
    };

    rbov-actions = {
      name = "Rbov Actions";
      exec = "xdg-open https://github.com/GranterOrg/radarbov-web/actions";
      icon = "/home/luiz/.dotfiles/assets/icons/rbov.png";
      terminal = false;
      categories = [ "Development" ];
    };

    rbov-board = {
      name = "Rbov Board";
      exec = ''xdg-open "https://github.com/orgs/GranterOrg/projects/28/views/1?filterQuery=assignee%%3A%%40me"'';
      icon = "/home/luiz/.dotfiles/assets/icons/rbov.png";
      terminal = false;
      categories = [ "Development" ];
    };

    youtube = {
      name = "YouTube";
      exec = "xdg-open https://www.youtube.com/";
      icon = "/home/luiz/.dotfiles/assets/icons/youtube.png";
      terminal = false;
      categories = [ "AudioVideo" ];
    };
  };
}
