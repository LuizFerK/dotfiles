{
  programs.fish = {
    enable = true;
    interactiveShellInit = "set fish_greeting";
    shellAliases = {
      g = "git";
      ga = "git add";
      gs = "git status";
      gc = "git commit";
      gp = "git push";
      gco = "git checkout branch";
      gcb = "git checkout branch -b";
      gcp = "git cherry-pick";
      nix-switch = "sudo nixos-rebuild switch --flake .";
      home-switch = "home-manager switch -b backup --flake .";
    };
  };
  programs.starship.enable = true;
  home.file.".config/starship.toml" = {
    source = ../../configs/starship/starship.toml;
  };
}