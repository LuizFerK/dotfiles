{
  pkgs,
  config,
  ...
}: {
  wayland.windowManager.hyprland.enable = true;
  wayland.windowManager.hyprland.settings = {
    source = ["~/.config/hypr/colors.conf"];

    env = [
      "XCURSOR_SIZE,24"
      "HYPRCURSOR_SIZE,24"
    ];

    monitor = [
      "HDMI-A-2, highres, -2560x0, 1"
      "DP-1, highres, 0x0, 1"
      "DP-2, highres, 2560x0, 1"
    ];

    exec-once = [
      "swww init"
      "waybar"
      "vesktop"
    ];

    input.kb_layout = "us,br";

    general = {
      gaps_in = 4;
      gaps_out = 5;
      border_size = 2;

      # "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
      # "col.inactive_border" = "rgba(595959aa)";

      # !!!!!!!!!!!!!!!
      allow_tearing = false;

      layout = "dwindle";
    };

    misc = {
      focus_on_activate = true;
      new_window_takes_over_fullscreen = 2;
    };
    
    decoration = {
      rounding = 10;

      active_opacity = 1;
      inactive_opacity = 1;

      drop_shadow = true;
      shadow_range = 4;
      shadow_render_power = 3;
      "col.shadow" = "rgba(1a1a1aee)";

      blur = {
        enabled = true;
        size = 3;
        passes = 3;

        vibrancy = 0.1696;
      };
    };

    animations = {
      enabled = true;
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
      animation = [
        "windows, 1, 3, md3_decel, popin 60%"
        "border, 1, 10, default"
        "borderangle, 1, 50, linear, loop"
        "fade, 1, 2.5, md3_decel"
        "workspaces, 1, 7, fluent_decel, slide"
        "specialWorkspace, 1, 3, md3_decel, slidevert"
      ];
    };

    bind = [
      # Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
      "SUPER, Return, exec, kitty"
      "SUPER, q, killactive"
      "SUPER, D, exec, rofi -show drun"
      "SUPER, SPACE, exec, hyprctl switchxkblayout sonix-usb-device next"

      # "SUPER, M, exit, "
      "SUPER, E, exec, dolphin"
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
      "SUPER,h,movefocus,l"
      "SUPER,l,movefocus,r"
      "SUPER,k,movefocus,u"
      "SUPER,j,movefocus,d"

      "SUPER_SHIFT,h,swapwindow,l"
      "SUPER_SHIFT,l,swapwindow,r"
      "SUPER_SHIFT,k,swapwindow,u"
      "SUPER_SHIFT,j,swapwindow,d"

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

    windowrulev2 = [
      # "float,title:^(.*)(Extension:)(.*)(- Bitwarden)(.*)$"
    ];

    bindm = [
      # Move/resize windows with mainMod + LMB/RMB and dragging
      "SUPER, mouse:272, movewindow"
      "SUPER, mouse:273, resizewindow"
    ];
  };

  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 12;
  };
}
