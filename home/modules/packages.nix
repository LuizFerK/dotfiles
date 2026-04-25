{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Desenvolvimento
    gcc
    cmake
    vim
    docker-compose
    nomad
    postgresql_16
    dbeaver-bin
    insomnia
    unstable.antigravity
    unstable.claude-code
    unstable.claude-agent-acp

    # Terminal e Performance
    kitty
    ripgrep
    btop
    neofetch
    nix-your-shell

    # Hyprland e Wayland
    grim
    slurp
    wl-clipboard

    # Navegadores e Redes
    firefox
    google-chrome
    openfortivpn

    # Multimídia
    vlc
    pavucontrol
    obs-studio
    spotify

    # Comunicação
    vesktop

    # Utilitários de Sistema
    zip
    unzip
    bootiso
    woeusb

    # Jogos
    steam
    steam-run
  ];
}
