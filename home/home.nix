{ config, outputs, pkgs, ... }:

{
  imports = [
    ./modules/packages.nix

    ./modules/entries.nix
    ./modules/fish.nix
    ./modules/git.nix
    ./modules/hyprland.nix
    ./modules/kitty.nix
    ./modules/ssh.nix
    ./modules/vesktop.nix
    ./modules/vscode.nix
    ./modules/wallust.nix
    ./modules/caelestia.nix
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
