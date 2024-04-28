{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Base
    google-chrome
    git
    vim
    kitty
    warp-terminal
    chromium

    # Hyprland
    waybar
    swww
    grim
    wl-clipboard
    slurp
    rofi-wayland

    # Ui pq eu sou nerd n sei oq n sei oq la
    # flameshot
    dbeaver
    nomad
    postgresql_13
    neofetch
    insomnia
    unzip
    docker-compose

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

  xdg.desktopEntries = {
    google-chrome = {
      categories = ["Application" "Network" "WebBrowser"];
      exec = "google-chrome-stable --enable-features=UseOzonePlatform --ozone-platform=wayland";
      icon = "google-chrome";
      name = "Google Chrome";
      terminal = false;
      type = "Application";
    };
    vencorddesktop = {
      categories = ["Chat" "Network" "InstantMessaging"];
      exec = "vencorddesktop --ozone-platform=wayland --disable-gpu %U";
      genericName = "Internet Messenger";
      icon = "vencorddesktop";
      name = "Vesktop";
      type = "Application";
      mimeType = ["x-scheme-handler/discord"];
      settings = {
        StartupWMClass = "VencordDesktop";
        Keywords = "discord;vencord;electron;chat";
      };
    };
  };
}