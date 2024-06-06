{ config, pkgs, ... }:

{
  imports = [
    ./modules/packages.nix

    ./modules/fish.nix
    ./modules/forceblur.nix
    ./modules/git.nix
    # ./modules/hyprland.nix
    ./modules/kitty.nix
    ./modules/konsole.nix
    ./modules/kvantum.nix
    ./modules/rofi.nix
    ./modules/ssh.nix
    ./modules/swww.nix
    ./modules/vscode.nix
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
  };

  programs.home-manager.enable = true;
}
