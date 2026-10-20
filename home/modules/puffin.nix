{ inputs, pkgs, ... }:

{
  # The package ships its own desktop entry and icons
  home.packages = [
    inputs.puffin.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
