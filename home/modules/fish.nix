{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting
      nix-your-shell fish | source
    '';
    shellAliases = {
      # Git
      g = "git";
      ga = "git add";
      gc = "git commit";
      gcb = "git checkout -b";
      gco = "git checkout";
      gcp = "git cherry-pick";
      gd = "git diff";
      gl = "git log";
      gp = "git push";
      gpl = "git pull";
      gs = "git status";
      
      # NixOS
      nd = "nix develop";
      ngc = "sudo nix-collect-garbage -d";
      nixos-switch = "sudo nixos-rebuild switch --flake ~/.dotfiles";
      flake-update = "sudo nix flake update --flake ~/.dotfiles";

      # Granter
      ciasc-vpn = "sudo openfortivpn sslvpn01.ciasc.gov.br --username=granter_lklein@vpn.ciasc.gov.br";
    };
  };
  programs.starship.enable = true;
  home.file.".config/starship.toml" = {
    source = ../../configs/starship/starship.toml;
  };
}