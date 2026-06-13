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
      gsh = "git show";

      # NixOS
      nd = "nix develop";
      nixos-switch = "sudo nixos-rebuild switch --flake ~/.dotfiles";
      nixos-update = "sudo nix flake update --flake ~/.dotfiles";

      # Dev
      z = "zeditor .";

      # Granter
      ciasc-vpn = "sudo openfortivpn sslvpn01.ciasc.gov.br --username=granter_lklein@vpn.ciasc.gov.br";
    };
  };
  programs.starship.enable = true;
  home.file.".config/starship.toml" = {
    source = ../../configs/starship.toml;
  };
}
