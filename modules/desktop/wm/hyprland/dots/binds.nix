{
  wayland.windowManager.hyprland.settings = {
    bind = [
      # Apps
      "$mainMod, Return, exec, uwsm-app -- $terminal"
      "$mainMod, Backspace, exec, uwsm-app -- $editor"
      "$mainMod, J, exec, uwsm app -- $browser"
      "$mainMod SHIFT, X, exec, uwsm app -- thunderbird"
      "$mainMod, M, exec, uwsm-app -- $explorer"

      # Bar
      "$mainMod CTRL,  B, exec, $bar-reload"
      "$mainMod SHIFT, B, exec, $bar-toggle"

      # Launcher
      "$mainMod, S, exec, $launcher"
      "$mainMod, K, exec, $clipboard"
      ", Print, exec, $screenshot"
      "$mainMod SHIFT, W, exec, pkill rofi || uwsm-app -- wallpaper"

      # Misc
      "$mainMod CTRL SHIFT, L, exec, uwsm-app -- hyprlock"
      "$mainMod, Q, killactive"
      "$mainMod SHIFT, Q, forcekillactive"

      "$mainMod, V, togglefloating"
      "$mainMod CTRL, V, exec, hyprctl dispatch centerwindow 1"
      "$mainMod SHIFT, V, fullscreen"
      # "$mainMod, PERIOD, cyclenext"
      "$mainMod, b, togglesplit"
      "$mainMod, comma, pseudo"

      # Group Control
      # "$mainMod, B, togglegroup"
      # "$mainMod CTRL, B, lockactivegroup, toggle"
      # "ALT, TAB, changegroupactive"

      # Set sticky
      # "$mainMod, B, pin"
      # "$mainMod, C, cyclenext"

      # Moving focus
      "$mainMod, A, movefocus, l"
      "$mainMod, E, movefocus, d"
      "$mainMod, I, movefocus, u"
      "$mainMod, C, movefocus, r"

      "$mainMod, Left,  movefocus, l"
      "$mainMod, Down,  movefocus, d"
      "$mainMod, Up,    movefocus, u"
      "$mainMod, Right, movefocus, r"

      # Moving windows
      "$mainMod SHIFT, A, swapwindow, l"
      "$mainMod SHIFT, E, swapwindow, d"
      "$mainMod SHIFT, I, swapwindow, u"
      "$mainMod SHIFT, C, swapwindow, r"

      "$mainMod, N, workspace, 1"
      "$mainMod, T, workspace, 2"
      "$mainMod, H, workspace, 3"
      "$mainMod, P, workspace, 4"
      "$mainMod, D, workspace, 5"
      "$mainMod, SEMICOLON, workspace, 6"
      "$mainMod, U, workspace, 7"
      "$mainMod, O, workspace, 8"
      "$mainMod, Y, workspace, 9"

      # Moving windows to workspaces
      # "$mainMod SHIFT, N, movetoworkspace, 1"
      # "$mainMod SHIFT, T, movetoworkspace, 2"
      # "$mainMod SHIFT, H, movetoworkspace, 3"
      # "$mainMod SHIFT, P, movetoworkspace, 4"
      # "$mainMod SHIFT, D, movetoworkspace, 5"
      # "$mainMod SHIFT, SEMICOLON, movetoworkspace, 6"
      # "$mainMod SHIFT, U, movetoworkspace, 7"
      # "$mainMod SHIFT, O, movetoworkspace, 8"
      # "$mainMod SHIFT, Y, movetoworkspace, 9"

      # Moving windows to workspaces (silent)
      "$mainMod SHIFT, N, movetoworkspacesilent, 1"
      "$mainMod SHIFT, T, movetoworkspacesilent, 2"
      "$mainMod SHIFT, H, movetoworkspacesilent, 3"
      "$mainMod SHIFT, P, movetoworkspacesilent, 4"
      "$mainMod SHIFT, D, movetoworkspacesilent, 5"
      "$mainMod SHIFT, SEMICOLON, movetoworkspacesilent, 6"
      "$mainMod SHIFT, U, movetoworkspacesilent, 7"
      "$mainMod SHIFT, O, movetoworkspacesilent, 8"
      "$mainMod SHIFT, Y, movetoworkspacesilent, 9"

      # Switching workspaces
      "$mainMod, 1, workspace, 1"
      "$mainMod, 2, workspace, 2"
      "$mainMod, 3, workspace, 3"
      "$mainMod, 4, workspace, 4"
      "$mainMod, 5, workspace, 5"
      "$mainMod, 6, workspace, 6"
      "$mainMod, 7, workspace, 7"
      "$mainMod, 8, workspace, 8"
      "$mainMod, 9, workspace, 9"

      # Moving windows to workspaces
      # "$mainMod SHIFT, 1, movetoworkspace, 1"
      # "$mainMod SHIFT, 2, movetoworkspace, 2"
      # "$mainMod SHIFT, 3, movetoworkspace, 3"
      # "$mainMod SHIFT, 4, movetoworkspace, 4"
      # "$mainMod SHIFT, 5, movetoworkspace, 5"
      # "$mainMod SHIFT, 6, movetoworkspace, 6"
      # "$mainMod SHIFT, 7, movetoworkspace, 7"
      # "$mainMod SHIFT, 8, movetoworkspace, 8"
      # "$mainMod SHIFT, 9, movetoworkspace, 9"

      # Moving windows to workspaces (silent)
      "$mainMod SHIFT, 1, movetoworkspacesilent, 1"
      "$mainMod SHIFT, 2, movetoworkspacesilent, 2"
      "$mainMod SHIFT, 3, movetoworkspacesilent, 3"
      "$mainMod SHIFT, 4, movetoworkspacesilent, 4"
      "$mainMod SHIFT, 5, movetoworkspacesilent, 5"
      "$mainMod SHIFT, 6, movetoworkspacesilent, 6"
      "$mainMod SHIFT, 7, movetoworkspacesilent, 7"
      "$mainMod SHIFT, 8, movetoworkspacesilent, 8"
      "$mainMod SHIFT, 9, movetoworkspacesilent, 9"
    ];

    binde = [
      "$mainMod, Minus,      resizeactive, -40 0"
      "$mainMod, Period,     resizeactive,  0  60"
      "$mainMod, APOSTROPHE, resizeactive,  0 -60"
      "$mainMod, Equal,      resizeactive,  40 0"

      # Moving floating windows       X  Y
      "$mainMod, Left,   moveactive, -40 0"
      "$mainMod, Down,   moveactive,  0  60"
      "$mainMod, Up,     moveactive,  0 -60"
      "$mainMod, Right,  moveactive,  40 0"

      # Switching workspaces
      "$mainMod, mouse_down, workspace, m-1"
      "$mainMod, mouse_up, workspace, m+1"
      # "$mainMod, Down, workspace, m-1"
      # "$mainMod, Up, workspace, m+1"
    ];

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
