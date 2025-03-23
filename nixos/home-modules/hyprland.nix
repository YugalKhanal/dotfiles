{
  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      # MONITORS
      monitor = [
        ",2560x1440@165.00,auto,auto"
      ];

      # ENV VARS
      env = [
        "XCURSOR_THEME,Banana"
        "XCURSOR_SIZE,50"
      ];

      # GENERAL
      general = {
        gaps_in = 1;
        gaps_out = 5;
        border_size = 1;
        resize_on_border = false;
        allow_tearing = false;
        layout = "dwindle";
        # col.active_border = "rgba(ffffffff) rgba(ffffffff) 45deg";
        # col.inactive_border = "rgba(595959aa)";
      };
      # if above doesn't work, convert it to the format below
      "general:col.active_border" = "rgba(ffffffff) rgba(ffffffff) 45deg";
      "general:col.inactive_border" = "rgba(595959aa)";

      # DECORATION
      decoration = {
        rounding = 1;
        active_opacity = 1.0;
        inactive_opacity = 0.75;
        blur = {
          enabled = true;
          size = 3;
          passes = 1;
          vibrancy = 0.1696;
        };
      };

      # ANIMATIONS
      animations = {
        enabled = false;
        bezier = [ "myBezier, 0.05, 0.9, 0.1, 1.05" ];
        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };

      # DWINDLE
      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      # MASTER
      master = {
        new_status = "master";
      };

      # MISC
      misc = {
        force_default_wallpaper = 0;
        disable_hyprland_logo = true;
      };

      # INPUT
      input = {
        kb_layout = "gb";
        kb_variant = "mac";
        kb_model = "macintosh";
        follow_mouse = 1;
        sensitivity = 0;
        touchpad = {
          natural_scroll = false;
        };
      };

      cursor = {
        no_warps = true;
      };

      gestures = {
        workspace_swipe = false;
      };

      device = [{
        name = "epic-mouse-v1";
        sensitivity = -0.5;
      }];

      # KEYBINDINGS
      "$mainMod" = "SUPER";

      bind = [
        "$mainMod, Return, exec, ghostty"
        "$mainMod, C, killactive"
        "$mainMod, M, exit"
        "$mainMod SHIFT, M, exec, systemctl suspend"
        "$mainMod, E, exec, thunar"
        "$mainMod, V, togglefloating"
        "$mainMod SHIFT, Return, exec, rofi -show drun -show-icons"
        "$mainMod, P, pseudo"
        "$mainMod, H, movefocus, l"
        "$mainMod, L, movefocus, r"
        "$mainMod, K, movefocus, u"
        "$mainMod, J, movefocus, d"
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"
        "$mainMod, mouse_down, workspace, e-1"
        "$mainMod, mouse_up, workspace, e+1"
        "$mainMod SHIFT, H, workspace, e-1"
        "$mainMod SHIFT, L, workspace, e+1"
        ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ", XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        ", XF86MonBrightnessUp, exec, brightnessctl s 10%+"
        ", XF86MonBrightnessDown, exec, brightnessctl s 10%-"
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPause, exec, playerctl play-pause"
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioPrev, exec, playerctl previous"
        "$mainMod, S, exec, rofi -show drun -show-icons"
        "SHIFT, Print, exec, grim - | wl-copy"
        "$mainMod SHIFT, Print, exec, grim -c - | wl-copy"
        ", Print, exec, grim -g \"$(slurp)\" - | wl-copy"
        "ALT , Print, exec, grim -g \"$(hyprctl activewindow -j | jq -r '\\(.at[0]),\\(.at[1]) \\(.size[0])x\\(.size[1])')\" - | wl-copy"
      ];

      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      windowrulev2 = [
        "suppressevent maximize, class:.*"
        "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
      ];

      exec-once = [
        "gsettings set org.gnome.desktop.interface cursor-theme 'banana'"
        "gsettings set org.gnome.desktop.interface cursor-size 50"
        "bash ~/.config/hypr/start.sh"
      ];
    };
  };
}
