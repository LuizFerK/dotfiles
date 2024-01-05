{ config, pkgs, ... }:

{
  imports = [
    ./modules/git.nix
  ];

  home = {
    username = "luiz";
    homeDirectory = "/home/luiz";

    sessionVariables = {
      # EDITOR = "emacs";
    };

    # Don't change. Read the Home Manager release notes before.
    stateVersion = "23.11";
  };

  programs.home-manager.enable = true;
}
