{
  description = "awesome description woooo";
     
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    impermanence = {
      url = "github:nix-community/impermanence";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs = {nixpkgs, ...} @ inputs:
  {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        inputs.disko.nixosModules.default
        (import ./disko/disko.nix { device = "/dev/nvme0n1"; })

        ./nixos/configuration.nix
              
        inputs.home-manager.nixosModules.default
        inputs.impermanence.nixosModules.impermanence
      ];
    };
  };
}