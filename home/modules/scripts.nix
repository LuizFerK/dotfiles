{ pkgs, ... }:

{
  home.packages = [
    (pkgs.writeShellApplication {
      name = "nixos-precommit";
      runtimeInputs = with pkgs; [
        nixfmt
        statix
        deadnix
      ];
      text = ''
        cd "$HOME/.dotfiles"

        echo "==> fmt"
        find . -name "*.nix" -not -path "./.git/*" -print0 | xargs -0 nixfmt

        echo "==> lint"
        statix check .

        echo "==> dead code"
        deadnix --fail .

        echo "==> build"
        tmplog=$(mktemp)
        nix build .#nixosConfigurations.nixos.config.system.build.toplevel --no-link 2>&1 | tee "$tmplog"
        if grep "^warning:" "$tmplog" | grep -qv "Git tree.*is dirty"; then
          rm -f "$tmplog"
          echo "build warnings — fix before committing"
          exit 1
        fi
        rm -f "$tmplog"

        echo "==> done"
      '';
    })
  ];
}
