{ inputs, pkgs, ... }:

{
  home.packages = with pkgs; [
    # Elixir
    inputs.expert.packages.x86_64-linux.default

    # Nix
    nil
    nixd
  ];
}
