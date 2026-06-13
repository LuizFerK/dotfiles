{ buildGoModule, ... }:

buildGoModule {
  pname = "nixos-cleanup";
  version = "0.1.0";
  src = ./.;
  vendorHash = "sha256-VgShimGlKMOGDVg2nvYzDmNITDfpHcZb8hzVXnjHqTs=";
}
