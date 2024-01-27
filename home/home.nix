{ config, pkgs, ... }:

{
  imports = [
    ./modules/packages.nix

    ./modules/autostart.nix
    ./modules/fish.nix
    ./modules/forceblur.nix
    ./modules/git.nix
    ./modules/konsole.nix
    ./modules/kvantum.nix
    ./modules/ssh.nix
    ./modules/vscode.nix
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
