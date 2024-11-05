{ config, outputs, pkgs, ... }:

{
  imports = [
    ./modules/packages.nix

    ./modules/entries.nix
    ./modules/fish.nix
    ./modules/forceblur.nix
    ./modules/git.nix
    ./modules/hyprland.nix
    ./modules/kitty.nix
    ./modules/konsole.nix
    ./modules/kvantum.nix
    ./modules/nvim.nix
    ./modules/rofi.nix
    # ./modules/spicetify.nix
    ./modules/ssh.nix
    ./modules/vesktop.nix
    ./modules/vscode.nix
    ./modules/wallpicker.nix
    ./modules/wallust.nix
    ./modules/waybar.nix
  ];

  home = {
    username = "luiz";
    homeDirectory = "/home/luiz";
    stateVersion = "23.11";
  };


  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
    overlays = [
      outputs.overlays.unstable-packages
    ];
  };

  programs.home-manager.enable = true;
}
