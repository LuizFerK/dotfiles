{ inputs, pkgs, ... }:

{
  home.packages = with pkgs; [
    inputs.zen-browser.packages."${system}".default

    ripgrep
    wallust
    gcc
    stylua
    unzip
    btop

    # Ui pq eu sou nerd n sei oq n sei oq la
    google-chrome
    vim
    flameshot
    docker-compose
    dbeaver-bin
    kate
    nomad
    postgresql_16
    neofetch
    insomnia
    # latte-dock

    # Hyprland
    kitty
    waybar
    swww
    grim
    wl-clipboard
    slurp
    rofi-wayland

    bootiso

    # IDUNOOOO
    spotify
    discord
    vesktop
    steam

    # Sound and video
    vlc

    # Networking
    openfortivpn

    # Fonts
    nerdfonts
    jetbrains-mono
    fira-code
    fira-code-symbols
    material-icons
    material-design-icons
    noto-fonts
    font-awesome
    terminus_font
    terminus-nerdfont
    fantasque-sans-mono
    papirus-icon-theme
  ];
}
