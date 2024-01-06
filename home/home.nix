{ config, pkgs, ... }:

{
  imports = [
    ./modules/packages.nix

    ./modules/fish.nix
    ./modules/git.nix
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
