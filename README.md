```
sudo su
git clone -b plasma https://github.com/LuizFerK/dotfiles.git /tmp/nixos
nix --experimental-features "nix-command flakes" run github:nix-community/disko -- --mode disko /tmp/nixos/disko/disko.nix --arg device '"/dev/nvme0n1"'
mkdir /mnt/etc
cp -r /tmp/nixos /mnt/etc/nixos
cp -r /tmp/nixos /mnt/persist/nixos
nixos-install --root /mnt --flake /mnt/etc/nixos#nixos
```