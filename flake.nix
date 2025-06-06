{
  description = "awesome description woooo";
     
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    impermanence.url = "github:nix-community/impermanence";
    spicetify-nix.url = "github:the-argus/spicetify-nix";

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {self, nixpkgs, ...} @ inputs: let
    inherit (self) outputs;
  in {
    overlays = import ./overlays {inherit inputs;};
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs outputs;};
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
