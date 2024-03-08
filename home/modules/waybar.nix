{ config, ... }:

{
  home.file.".config/waybar" = {
    source = config.lib.file.mkOutOfStoreSymlink ../../configs/waybar;
    recursive = true;
  };
}