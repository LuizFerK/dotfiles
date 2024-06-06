{inputs, ...}: {
  # additions = final: _prev: import ../pkgs {pkgs = final;};

  modifications = final: prev: {
    # xwaylandvideobridge = prev.xwaylandvideobridge.overrideAttrs (oldAttrs: rec {
    #   version = "0.4.0";

    #   src = prev.fetchFromGitLab {
    #     domain = "invent.kde.org";
    #     owner = "system";
    #     repo = "xwaylandvideobridge";
    #     rev = "v${version}";
    #     hash = "sha256-DzNJxZbSdhqdtIQvQ7ZKrKwu6zTcBjtsR9rv/uudZcw=";
    #   };
    # });
  };

  unstable-packages = final: _prev: {
    unstable = import inputs.nixpkgs-unstable {
      system = final.system;
      config.allowUnfree = true;
    };
  };
}
