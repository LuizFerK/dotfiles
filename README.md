```
# Installation
sudo su
git clone https://github.com/LuizFerK/dotfiles.git /tmp/nixos
nix --experimental-features "nix-command flakes" run github:nix-community/disko -- --mode disko /tmp/nixos/disko/disko.nix --arg device '"/dev/nvme0n1"'
mkdir /mnt/etc
cp -r /tmp/nixos /mnt/etc/nixos
nixos-install --root /mnt --flake /mnt/etc/nixos#nixos

# Restore bootloader
sudo su
mount /dev/root_vg/root -t btrfs -o subvol=root /mnt
mount /dev/root_vg/root -t btrfs -o subvol=nix /mnt/nix
mount /dev/nvme0n1p2 /mnt/boot
nixos-enter
```