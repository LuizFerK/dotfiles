{ config, lib, pkgs, inputs, outputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  # Nixpkgs
  nixpkgs = {
    overlays = [
      outputs.overlays.unstable-packages
    ];
    config.allowUnfree = true;
  };

  # Pkgs
  environment.systemPackages = [
    (pkgs.callPackage ../pkgs/cursor.nix {})
  ];

  # Grub
  boot.loader = {
    efi.canTouchEfiVariables = true;
    grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";
      useOSProber = true;
    };
  };

  # Timezone
  time.timeZone = "America/Sao_Paulo";

  # Network
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  # Users
  users.users.luiz = {
    isNormalUser = true;
    initialPassword = "1";
    shell = pkgs.fish;
    extraGroups = [ "networkmanager" "wheel" "docker" "adbusers" ];
  };

  programs.fish.enable = true;
  programs.adb.enable = true;
  virtualisation.docker.enable = true;
  security.sudo.wheelNeedsPassword = false;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];


  # Home manager
  programs.fuse.userAllowOther = true;
  home-manager = {
    extraSpecialArgs = {inherit inputs outputs;};
    backupFileExtension = "backup";
    users = {
      luiz = import ../home/home.nix;
    };
  };

  # Hyprland
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  services = {
    xserver = {
      enable = true;
      videoDrivers = ["nvidia"];
      xkb = {
        layout = "us";
        variant = "intl";
      };
      desktopManager.plasma5.enable = true;
      exportConfiguration = true;
    };
    displayManager.sddm.enable = true;
  };

  # Audio
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };
  services.blueman.enable = true;

  # Hardware stuff
  hardware = {
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
    };
    nvidia = {
      modesetting.enable = true;
      open = false;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.beta;
    };
  };

  boot.kernelPackages = pkgs.unstable.linuxPackages_zen;

  # Wipe off root filesystem on reboot
  # boot.initrd.postDeviceCommands = lib.mkAfter ''
  #   mkdir /btrfs_tmp
  #   mount /dev/root_vg/root /btrfs_tmp
  #   if [[ -e /btrfs_tmp/root ]]; then
  #       mkdir -p /btrfs_tmp/old_roots
  #       timestamp=$(date --date="@$(stat -c %Y /btrfs_tmp/root)" "+%Y-%m-%-d_%H:%M:%S")
  #       mv /btrfs_tmp/root "/btrfs_tmp/old_roots/$timestamp"
  #   fi

  #   delete_subvolume_recursively() {
  #       IFS=$'\n'
  #       for i in $(btrfs subvolume list -o "$1" | cut -f 9- -d ' '); do
  #           delete_subvolume_recursively "/btrfs_tmp/$i"
  #       done
  #       btrfs subvolume delete "$1"
  #   }

  #   for i in $(find /btrfs_tmp/old_roots/ -maxdepth 1 -mtime +30); do
  #       delete_subvolume_recursively "$i"
  #   done

  #   btrfs subvolume create /btrfs_tmp/root
  #   umount /btrfs_tmp
  # '';

  # Impermanence
  # fileSystems."/persist".neededForBoot = true;
  # environment.persistence."/persist/system" = {
  #   hideMounts = true;
  #   directories = [
  #     "/etc/nixos"
  #     "/var/log"
  #     "/var/lib/bluetooth"
  #     "/var/lib/nixos"
  #     "/var/lib/systemd/coredump"
  #     "/etc/NetworkManager/system-connections"
  #   ];
  # };
  
  system.stateVersion = "23.11";
}