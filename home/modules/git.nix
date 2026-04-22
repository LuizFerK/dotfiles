{
  programs.git = {
    enable = true;
    lfs.enable = true;
    settings = {
      user = {
        name = "LuizFerK";
        email = "luizfernandoklein@live.com";
      };
      init.defaultBranch = "main";
      core.editor = "vim";
    };
  };
}
