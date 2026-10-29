{
  config,
  pkgs,
  inputs,
  outputs,
  ...
}:

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

  # Boot
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
  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
  };

  # Users
  users.users.luiz = {
    isNormalUser = true;
    initialPassword = "1";
    shell = pkgs.fish;
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
    ];
  };

  # Security
  security = {
    sudo.wheelNeedsPassword = false;
    rtkit.enable = true;
  };

  # Nix
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Virtualisation
  virtualisation.docker.enable = true;

  # Programs
  programs = {
    fish.enable = true;
    fuse.userAllowOther = true;
    hyprland = {
      enable = true;
      xwayland.enable = true;
    };
  };

  # Home manager
  home-manager = {
    extraSpecialArgs = { inherit inputs outputs; };
    backupFileExtension = "backup";
    users = {
      luiz = import ../home/home.nix;
    };
  };

  # Services
  services = {
    # Display
    xserver = {
      enable = true;
      videoDrivers = [ "nvidia" ];
      xkb = {
        layout = "us";
        variant = "intl";
      };
      exportConfiguration = true;
    };
    desktopManager.plasma6.enable = true;
    displayManager.sddm.enable = true;

    # Bluetooth
    blueman.enable = true;

    # Audio
    pulseaudio.enable = false;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
  };

  # Hardware
  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
    graphics = {
      enable = true;
      enable32Bit = true;
    };
    nvidia = {
      modesetting.enable = true;
      open = false;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.beta;
    };
  };

  system.stateVersion = "23.11";
}
