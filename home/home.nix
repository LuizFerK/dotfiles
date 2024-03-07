{ pkgs, inputs, ... }:

{
  imports = [
    inputs.impermanence.nixosModules.home-manager.impermanence

    ./modules/git.nix
    ./modules/hyprland.nix
    ./modules/kitty.nix
    ./modules/packages.nix
    ./modules/ssh.nix
    ./modules/vscode.nix
  ];

  home = {
    # username = "luiz";
    # homeDirectory = "/home/luiz";
    stateVersion = "23.11";
  };
  
  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };

  # home.persistence."/persist/home" = {
  #   directories = [
  #     "Downloads"
  #     "Pictures"
  #     "Documents"
  #     ".ssh"
  #   ];
  #   allowOther = true;
  # };
}
