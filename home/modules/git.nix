{
  programs.git = {
    enable = true;
    lfs.enable = true;
    userName  = "LuizFerK";
    userEmail = "luizfernandoklein@live.com";
    extraConfig = {
      init.defaultBranch = "main";
      core = {
        editor = "vim";
      };
    };
  };
}