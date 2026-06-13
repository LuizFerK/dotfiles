{
  pkgs,
  ...
}:
{
  wayland.windowManager.hyprland.enable = true;
  wayland.windowManager.hyprland.configType = "hyprlang";
  wayland.windowManager.hyprland.settings = {
    env = [
      "XCURSOR_SIZE,24"
      "HYPRCURSOR_SIZE,24"
    ];

    monitor = [
      # "HDMI-A-2, highres, -2560x0, 1"
      "DP-2, highres, 0x0, 1"
      "DP-1, highres, 2560x0, 1"
    ];

    exec-once = [
      "caelestia-shell"
      "sh -c 'until out=$(caelestia shell idleInhibitor enable 2>&1) && [[ \"$out\" != *\"Target not found\"* ]]; do sleep 1; done'"
      "vesktop"
    ];

    input.kb_layout = "us,br";

    general = {
      gaps_in = 4;
      gaps_out = 6;
      border_size = 2;

      "col.active_border" = "rgba(03fcadee) rgba(595959aa) 45deg";
      "col.inactive_border" = "rgba(595959aa)";

      allow_tearing = false;

      layout = "dwindle";
    };

    misc = {
      focus_on_activate = true;
      disable_hyprland_logo = true;
      disable_splash_rendering = true;
    };

    ecosystem = {
      no_update_news = true;
      no_donation_nag = true;
    };

    decoration = {
      rounding = 20;

      active_opacity = 1;
      inactive_opacity = 1;

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
      "SUPER, Return, exec, kitty"
      "SUPER, q, killactive"
      "SUPER, D, global, caelestia:launcher"
      "SUPER, SPACE, exec, hyprctl switchxkblayout sonix-usb-device next"

      "SUPER, E, exec, dolphin"
      "SUPER, F, fullscreen, 1"
      "SUPER, T, togglegroup, "
      "SUPER, V, togglefloating, "
      "SUPER_SHIFT, S, exec, grim -g \"$(slurp -d)\" - | wl-copy"

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

      # Switch workspaces
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

      # Move active window to workspace
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

    windowrule = [
      "opacity 0.85 0.85, match:class ^(firefox)$"
      "opacity 0.85 0.85, match:class ^(puffin)$"
    ];

    layerrule = [
      "no_anim 1, match:namespace caelestia-(launcher|osd|notifications|border-exclusion|area-picker)"
      "animation fade, match:namespace caelestia-(drawers|background)"
      "order 1, match:namespace caelestia-border-exclusion"
      "order 2, match:namespace caelestia-bar"
      "xray 1, match:namespace caelestia-(border|launcher|bar|sidebar|navbar|mediadisplay|screencorners)"
      "blur 1, match:namespace caelestia-.*"
      "blur 1, match:namespace qs-.*"
      "blur_popups 1, match:namespace caelestia-.*"
      "ignore_alpha 0.85, match:namespace caelestia-.*"
    ];

    bindm = [
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
