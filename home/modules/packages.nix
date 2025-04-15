{ inputs, pkgs, ... }:

{
  home.packages = with pkgs; [
    ripgrep
    wallust
    pywal
    gcc
    stylua
    unzip
    btop
    rars
    pavucontrol

    # Ui pq eu sou nerd n sei oq n sei oq la
    google-chrome
    firefox
    lazydocker
    vim
    flameshot
    docker-compose
    dbeaver-bin
    kate
    nomad
    postgresql_16
    neofetch
    insomnia
    jetbrains.datagrip
    unstable.code-cursor
    nix-your-shell
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
