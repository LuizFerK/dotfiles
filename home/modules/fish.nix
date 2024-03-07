{
  programs.fish = {
    enable = true;
    interactiveShellInit = "set fish_greeting";
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
      nix-switch = "sudo nixos-rebuild switch --flake ~/.dotfiles";
      home-switch = "home-manager switch -b backup --flake ~/.dotfiles";
      flake-update = "nix flake update ~/.dotfiles";

      # Granter
      ciasc-vpn = "sudo openfortivpn sslvpn01.ciasc.gov.br --username=granter_lklein@vpn.ciasc.gov.br";
    };
  };
  programs.starship.enable = true;
  home.file.".config/starship.toml" = {
    source = ../../configs/starship/starship.toml;
  };
}