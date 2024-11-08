{ pkgs, ... }:

{
  home.file.".config/Code/User/settings.json" = {
    source = ../../configs/vscode/settings.json;
  };
  home.file.".config/Cursor/User/settings.json" = {
    source = ../../configs/vscode/settings.json;
  };
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
        bbenoist.nix
        elixir-lsp.vscode-elixir-ls
        naumovs.color-highlight
        phoenixframework.phoenix
        bradlc.vscode-tailwindcss
        ms-python.python
      ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        {
          name = "vscode-todo-highlight";
          publisher = "wayou";
          version = "1.0.5";
          sha256 = "CQVtMdt/fZcNIbH/KybJixnLqCsz5iF1U0k+GfL65Ok=";
        }
        {
          name = "symbols";
          publisher = "miguelsolorio";
          version = "0.0.16";
          sha256 = "LGCeqleDGWveJ7KPYd6+ArynEpET4xrhvI2H4NPuCtQ=";
        }
        {
          name = "tabler-icons";
          publisher = "zguolee";
          version = "0.3.2";
          sha256 = "2mMIizDest4rdFKLHttOxROPZwcWYp/kmOdXjJsDWFA=";
        }
        {
          name = "fluent-icons";
          publisher = "miguelsolorio";
          version = "0.0.18";
          sha256 = "sE0A441QPwokBoLoCqtImDHmlAXd66fj8zsJR7Ci+Qs=";
        }
        {
          name = "volar";
          publisher = "vue";
          version = "1.8.27";
          sha256 = "KfWgdz61NURmS1cwFsE9AmIrEykyN5MXIKfG8gDfmac=";
        }
        {
          name = "alphabetical-sorter";
          publisher = "ue";
          version = "2.0.1";
          sha256 = "L9soYAaa+7FTzQ9J1EwS0LpT2YIEhCd6DRBdwZJaX7Y=";
        }
      ];
  };
}