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
    yaak
    unstable.claude-agent-acp

    # Terminal e Performance
    kitty
    ripgrep
    btop
    fastfetch
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

    # Utilitários de Sistema
    zip
    unzip
    bootiso
    woeusb
    (callPackage ../../pkgs/nixos-cleanup { })

    # Jogos
    steam
    steam-run
  ];
}
