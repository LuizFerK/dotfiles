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
    };
  };
  programs.starship.enable = true;
  home.file.".config" = {
    source = ../../configs/starship;
    recursive = true;
  };
}