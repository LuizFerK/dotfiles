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
      gs = "git status";
      gc = "git commit";
      gp = "git push";
      gco = "git checkout";
      gcb = "git checkout -b";
      gcp = "git cherry-pick";
      
      # NixOS
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