{ outputs, ... }:

{
  imports = [
    ./modules/packages.nix

    ./modules/files.nix
    ./modules/fonts.nix
    ./modules/fish.nix
    ./modules/git.nix
    ./modules/hyprland.nix
    ./modules/kitty.nix
    ./modules/lsp.nix
    ./modules/puffin.nix
    ./modules/vesktop.nix
    ./modules/caelestia.nix
    ./modules/zed.nix
    ./modules/claude.nix
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
