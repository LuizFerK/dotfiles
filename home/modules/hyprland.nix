{
  inputs,
  pkgs,
  config,
  ...
}: {
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        terminal = "warp-terminal";
        # prompt = ">> ";
        # layer = "overlay";
      };

      border = {
        radius = 10;
        width = 2;
      };
    };
  };

  wayland.windowManager.hyprland.enable = true;
  wayland.windowManager.hyprland.package = inputs.hyprland.packages."${pkgs.system}".hyprland;
  wayland.windowManager.hyprland.settings = {
    "$monitor_left" = "HDMI-A-2";
    "$monitor_center" = "DP-1";
    "$monitor_right" = "DP-2";

    env = [
      # "LIBVA_DRIVER_NAME,nvidia"
      "XDG_SESSION_TYPE,wayland"
      "GBM_BACKEND,nvidia-drm"
      "__GLX_VENDOR_LIBRARY_NAME,nvidia"
      "WLR_NO_HARDWARE_CURSORS,1"
    ];

    monitor = [
      "$monitor_left, highres, -2560x0, 1"
      "$monitor_center, highres, 0x0, 1"
      "$monitor_right, highres, 2560x0, 1"
    ];

    exec-once = [
      "swww init"
      "waybar"
      "discord"
      # "xwaylandvideobridge"
    ];

    input.kb_layout = "us,br";

    bind = [
      # Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
      "SUPER, Return, exec, kitty"
      "SUPER_SHIFT,q,killactive"
      "SUPER, D, exec, rofi -show drun"
      "SUPER, SPACE, exec, hyprctl switchxkblayout sonix-usb-device next"

      # "SUPER, M, exit, "
      # "SUPER, E, exec, dolphin"
      "SUPER, F, fullscreen, 1"
      "SUPER, T, togglegroup, "
      "SUPER, V, togglefloating, "
      # "SUPER, P, pseudo, # dwindle"
      # "SUPER, J, togglesplit, # dwindle"
      "SUPER, Print, exec, grim -g \"$(slurp -d)\" - | wl-copy"

      # Sound control
      ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
      ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ", XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"

      # Window movement
      "SUPER,j,movefocus,l"
      "SUPER,l,movefocus,r"
      "SUPER,i,movefocus,u"
      "SUPER,k,movefocus,d"

      "SUPER_SHIFT,j,swapwindow,l"
      "SUPER_SHIFT,l,swapwindow,r"
      "SUPER_SHIFT,i,swapwindow,u"
      "SUPER_SHIFT,k,swapwindow,d"

      # Switch workspaces with mainMod + [0-9]
      "SUPER, 1, workspace, 1"
      "SUPER, 2, workspace, 2"
      "SUPER, 3, workspace, 3"
      "SUPER, 4, workspace, 4"
      "SUPER, 5, workspace, 5"
      "SUPER, 6, workspace, 6"
      "SUPER, 7, workspace, 7"
      "SUPER, 8, workspace, 8"
      "SUPER, 9, workspace, 9"
      "SUPER, 0, workspace, 10"

      # Move active window to a workspace with mainMod + SHIFT + [0-9]
      "SUPER_SHIFT, 1, movetoworkspace, 1"
      "SUPER_SHIFT, 2, movetoworkspace, 2"
      "SUPER_SHIFT, 3, movetoworkspace, 3"
      "SUPER_SHIFT, 4, movetoworkspace, 4"
      "SUPER_SHIFT, 5, movetoworkspace, 5"
      "SUPER_SHIFT, 6, movetoworkspace, 6"
      "SUPER_SHIFT, 7, movetoworkspace, 7"
      "SUPER_SHIFT, 8, movetoworkspace, 8"
      "SUPER_SHIFT, 9, movetoworkspace, 9"
      "SUPER_SHIFT, 0, movetoworkspace, 10"

      "SUPER, P, togglespecialworkspace"
      "SUPER, O, movetoworkspace, special"
    ];

    bindm = [
      # Move/resize windows with mainMod + LMB/RMB and dragging
      "SUPER, mouse:272, movewindow"
      "SUPER, mouse:273, resizewindow"
    ];

    # workspace = [
    #   # Set stick workspaces to the monitors
    #   "1, monitor:$monitor_left"
    #   "3, monitor:$monitor_left"

    #   "2, monitor:$monitor_center"
    #   "4, monitor:$monitor_center"

    #   "6, monitor:$monitor_right"
    # ];

    general = {
      # See https://wiki.hyprland.org/Configuring/Variables/ for more

      gaps_in = 4;
      gaps_out = 5;
      border_size = 0;

      # "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
      # "col.inactive_border" = "rgba(595959aa)";

      layout = "dwindle";
    };

    decoration = {
      # See https://wiki.hyprland.org/Configuring/Variables/ for more

      rounding = 10;
      blur = {
        enabled = true;
        xray = true;
        ignore_opacity = true;
        new_optimizations = "on";
        size = 1;
        passes = 4;
      };

      drop_shadow = "yes";
      shadow_range = 4;
      shadow_render_power = 3;
      "col.shadow" = "rgba(1a1a1aee)";

      dim_inactive = false;
      dim_strength = 0.1;
      dim_special = 0;
    };

    animations = {
      enabled = "yes";
      bezier = [
        "linear, 0, 0, 1, 1"
        "md3_standard, 0.2, 0, 0, 1"
        "md3_decel, 0.05, 0.7, 0.1, 1"
        "md3_accel, 0.3, 0, 0.8, 0.15"
        "overshot, 0.05, 0.9, 0.1, 1.1"
        "crazyshot, 0.1, 1.5, 0.76, 0.92 "
        "hyprnostretch, 0.05, 0.9, 0.1, 1.0"
        "fluent_decel, 0.1, 1, 0, 1"
        "easeInOutCirc, 0.85, 0, 0.15, 1"
        "easeOutCirc, 0, 0.55, 0.45, 1"
        "easeOutExpo, 0.16, 1, 0.3, 1"
      ];
      # Animation configs

      animation = [
        "windows, 1, 3, md3_decel, popin 60%"
        "border, 1, 10, default"
        "fade, 1, 2.5, md3_decel"
        # "workspaces, 1, 3.5, md3_decel, slide"
        "workspaces, 1, 7, fluent_decel, slide"
        # "workspaces, 1, 7, fluent_decel, slidefade 15%"
        # "specialWorkspace, 1, 3, md3_decel, slidefadevert 15%"
        "specialWorkspace, 1, 3, md3_decel, slidevert"
      ];
    };

    misc = {
      vfr = 1;
      vrr = 1;
      # layers_hog_mouse_focus = true;
      focus_on_activate = true;
      animate_manual_resizes = false;
      animate_mouse_windowdragging = false;
      enable_swallow = false;
      swallow_regex = "(foot|kitty|allacritty|Alacritty)";

      disable_hyprland_logo = true;
      force_default_wallpaper = 0;
      new_window_takes_over_fullscreen = 2;
    };

    windowrule = [
      # Dialogs
      "float,title:^(Open File)(.*)$"
      "float,title:^(Select a File)(.*)$"
      "float,title:^(Choose wallpaper)(.*)$"
      "float,title:^(Open Folder)(.*)$"
      "float,title:^(Save As)(.*)$"
      "float,title:^(Library)(.*)$"
    ];

    windowrulev2 = [
      "opacity 0.95 0.95,class:^(Alacritty|Discord|Spotify)$"
      "opacity 1 0.6,class:(kitty)"
      
      "tile,class:^(dev.warp.Warp)$"

      "noblur,class:^(dash)$"
      "noborder,class:^(dash)$"
      "noshadow,class:^(dash)$"

      # XWaylandVideoBridge
      "opacity 0.0 override 0.0 override,class:^(xwaylandvideobridge)$"
      "noanim,class:^(xwaylandvideobridge)$"
      "noinitialfocus,class:^(xwaylandvideobridge)$"
      "maxsize 1 1,class:^(xwaylandvideobridge)$"
      "noblur,class:^(xwaylandvideobridge)$"
    ];
  };

  wayland.windowManager.hyprland.extraConfig = ''
    # window resize
    bind = SUPER, R, submap, resize

    submap = resize
    binde = , l, resizeactive, 30 0
    binde = , j, resizeactive, -30 0
    binde = , i, resizeactive, 0 -30
    binde = , k, resizeactive, 0 30
    bind = , escape, submap, reset
    submap = reset
  '';

  home.pointerCursor = {
    gtk.enable = true;
    # x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 8;
  };

  gtk = {
    enable = true;
    theme = {
      package = pkgs.flat-remix-gtk;
      name = "Flat-Remix-GTK-Grey-Darkest";
    };

    iconTheme = {
      package = pkgs.gnome.adwaita-icon-theme;
      name = "Adwaita";
    };

    font = {
      name = "Sans";
      size = 10;
    };
  };
}
