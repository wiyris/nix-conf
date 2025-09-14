{
  wayland.windowManager.hyprland.settings = {
    bind = [
      # Apps
      "$mainMod, Space, exec, uwsm-app -- $terminal"
      "$mainMod, J, exec, uwsm app -- $browser"
      # "$mainMod, M, exec, uwsm-app -- $explorer"

      # Bar
      # "$mainMod SHIFT, PERIOD, exec, $bar-reload"
      # "$mainMod CTRL, PERIOD, exec, $bar-toggle"

      # Performace mode

      # Rofi
      "$mainMod, F, exec, $launcher"

      # Misc
      "$mainMod, Q, killactive"
      "$mainMod SHIFT, Q, forcekillactive"
      # "$mainMod SHIFT, H, fullscreen"
      # "$mainMod, S, togglefloating"
      # "$mainMod SHIFT, S, exec, hyprctl dispatch centerwindow 1"
      # "$mainMod, PERIOD, cyclenext"
      # "$mainMod, U, togglesplit"
      # "$mainMod, semicolon, pseudo"

      # Group Control
      # "$mainMod, B, togglegroup"
      # "$mainMod CTRL, B, lockactivegroup, toggle"
      # "ALT, TAB, changegroupactive"

      # Set sticky
      # "$mainMod, B, pin"
      # "$mainMod, C, cyclenext"

      # Moving focus
      "$mainMod, COMMA, movefocus, l"
      "$mainMod, a,     movefocus, d"
      "$mainMod, e,     movefocus, u"
      "$mainMod, i,     movefocus, r"

      "$mainMod, Left,  movefocus, l"
      "$mainMod, Down,  movefocus, d"
      "$mainMod, Up,    movefocus, u"
      "$mainMod, Right, movefocus, r"

      # Moving windows
      "$mainMod SHIFT, COMMA,  swapwindow, l"
      "$mainMod SHIFT, a,      swapwindow, d"
      "$mainMod SHIFT, e,      swapwindow, u"
      "$mainMod SHIFT, i,      swapwindow, r"

      "$mainMod, N, workspace, 1"
      "$mainMod, T, workspace, 2"
      "$mainMod, H, workspace, 3"
      "$mainMod, P, workspace, 4"
      "$mainMod, D, workspace, 5"
      "$mainMod, L, workspace, 6"
      "$mainMod, W, workspace, 7"
      "$mainMod, G, workspace, 8"
      "$mainMod, M, workspace, 9"

      # Moving windows to workspaces
      "$mainMod SHIFT, N, movetoworkspace, 1"
      "$mainMod SHIFT, T, movetoworkspace, 2"
      "$mainMod SHIFT, H, movetoworkspace, 3"
      "$mainMod SHIFT, P, movetoworkspace, 4"
      "$mainMod SHIFT, D, movetoworkspace, 5"
      "$mainMod SHIFT, L, movetoworkspace, 6"
      "$mainMod SHIFT, W, movetoworkspace, 7"
      "$mainMod SHIFT, G, movetoworkspace, 8"
      "$mainMod SHIFT, M, movetoworkspace, 9"

      # Moving windows to workspaces (silent)
      "$mainMod ALT, N, movetoworkspacesilent, 1"
      "$mainMod ALT, T, movetoworkspacesilent, 2"
      "$mainMod ALT, H, movetoworkspacesilent, 3"
      "$mainMod ALT, P, movetoworkspacesilent, 4"
      "$mainMod ALT, D, movetoworkspacesilent, 5"
      "$mainMod ALT, L, movetoworkspacesilent, 6"
      "$mainMod ALT, W, movetoworkspacesilent, 7"
      "$mainMod ALT, G, movetoworkspacesilent, 8"
      "$mainMod ALT, M, movetoworkspacesilent, 9"
    ];

    binde = [
      # Resizing windows                        X  Y
      # "$mainMod CTRL, COMMA,   resizeactive, -40 0"
      # "$mainMod CTRL, a,       resizeactive,  0  60"
      # "$mainMod CTRL, e,       resizeactive,  0 -60"
      # "$mainMod CTRL, i,       resizeactive,  40 0"
      "$mainMod, Minus,      resizeactive, -40 0"
      "$mainMod, Periop,     resizeactive,  0  60"
      "$mainMod, APOSTROPHE, resizeactive,  0 -60"
      "$mainMod, Equal,      resizeactive,  40 0"

      # Moving floating windows             X  Y
      "$mainMod CTRL, COMMA,   moveactive, -40 0"
      "$mainMod CTRL, a,       moveactive,  0  60"
      "$mainMod CTRL, e,       moveactive,  0 -60"
      "$mainMod CTRL, i,       moveactive,  40 0"

      # Switching workspaces
      # "$mainMod, mouse_down, workspace, m-1"
      # "$mainMod, mouse_up, workspace, m+1"
      # "$mainMod CTRL, A, workspace, m-1"
      # "$mainMod CTRL, E, workspace, m+1"
      "$mainMod, Down, workspace, m-1"
      "$mainMod, Up, workspace, m+1"
    ];

    # Laptop multimedia keys for volume and LCD brightness
    bindel = [
      ", XF86AudioRaiseVolume,  exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
      ", XF86AudioLowerVolume,  exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      ", XF86AudioMute,         exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ", XF86AudioMicMute,      exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
    ];

    # Audio playback
    bindl = [
      ", XF86AudioNext,  exec, playerctl next"
      ", XF86AudioPause, exec, playerctl play-pause"
      ", XF86AudioPlay,  exec, playerctl play-pause"
      ", XF86AudioPrev,  exec, playerctl previous"
    ];

    bindm = [
      "SUPER, mouse:272, movewindow"
      "SUPER, mouse:273, resizewindow"
    ];
  };
}
