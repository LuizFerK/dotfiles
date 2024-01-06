{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Ui pq eu sou nerd n sei oq n sei oq la
    vscode
    flameshot
    docker-compose
    dbeaver
    kate
    # latte-dock

    # IDUNOOOO
    spotify
    discord
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
  ];
}