{ inputs, pkgs, ... }:

{
  home.packages = with pkgs; [
    ripgrep
    gcc
    unzip
    zip
    btop
    pavucontrol
    cmake

    # Ui pq eu sou nerd n sei oq n sei oq la
    google-chrome
    firefox
    vim
    docker-compose
    dbeaver-bin
    nomad
    postgresql_16
    neofetch
    insomnia
    nix-your-shell
    unstable.antigravity

    # Hyprland
    kitty
    grim
    wl-clipboard
    slurp
    obs-studio
    steam-run

    bootiso
    woeusb

    # IDUNOOOO
    spotify
    discord
    vesktop
    steam

    # Sound and video
    vlc

    # Networking
    openfortivpn
  ];

  xdg.desktopEntries.puffin = {
    name = "Puffin";
    comment = "PostgreSQL GUI";
    exec = "nix run /home/luiz/apps/puffin";
    icon = "/home/luiz/apps/puffin/public/logo.png";
    categories = [ "Development" "Utility" ];
    terminal = false;
    type = "Application";
  };
}
