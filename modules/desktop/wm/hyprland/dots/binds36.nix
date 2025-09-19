{
  wayland.windowManager.hyprland.settings = {
    bind = [
      # Apps
      "$mainMod, Space, exec, uwsm-app -- $terminal"
      "$mainMod, J, exec, uwsm app -- $browser"
      # "$mainMod, M, exec, uwsm-app -- $explorer"

      # Bar
      "$mainMod SHIFT, PERIOD, exec, $bar-reload"
      "$mainMod CTRL, PERIOD, exec, $bar-toggle"

      # Rofi
      "$mainMod, S, exec, $launcher"
      # "$mainMod, X, exec, cliphist list | rofi -dmenu -theme .config/rofi/theme/cliphist.rasi | cliphist decode | wl-copy"
      "$mainMod, C, exec, stash list | cut -f2- | tofi --width 500 --prompt-text '' | stash decode | wl-copy"
      # ", Print, exec, pkill rofi || uwsm-app -- screenshot"

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
      # "$mainMod, L, workspace, 6"
      # "$mainMod, W, workspace, 7"
      # "$mainMod, G, workspace, 8"
      # "$mainMod, M, workspace, 9"
      "$mainMod, SEMICOLON, workspace, 6"
      "$mainMod, U, workspace, 7"
      "$mainMod, O, workspace, 8"
      "$mainMod, Y, workspace, 9"

      # Moving windows to workspaces
      "$mainMod SHIFT, N, movetoworkspace, 1"
      "$mainMod SHIFT, T, movetoworkspace, 2"
      "$mainMod SHIFT, H, movetoworkspace, 3"
      "$mainMod SHIFT, P, movetoworkspace, 4"
      "$mainMod SHIFT, D, movetoworkspace, 5"
      # "$mainMod SHIFT, L, movetoworkspace, 6"
      # "$mainMod SHIFT, W, movetoworkspace, 7"
      # "$mainMod SHIFT, G, movetoworkspace, 8"
      # "$mainMod SHIFT, M, movetoworkspace, 9"
      "$mainMod SHIFT, SEMICOLON, movetoworkspace, 6"
      "$mainMod SHIFT, U, movetoworkspace, 7"
      "$mainMod SHIFT, O, movetoworkspace, 8"
      "$mainMod SHIFT, Y, movetoworkspace, 9"

      # Moving windows to workspaces (silent)
      "$mainMod ALT, N, movetoworkspacesilent, 1"
      "$mainMod ALT, T, movetoworkspacesilent, 2"
      "$mainMod ALT, H, movetoworkspacesilent, 3"
      "$mainMod ALT, P, movetoworkspacesilent, 4"
      "$mainMod ALT, D, movetoworkspacesilent, 5"
      # "$mainMod ALT, L, movetoworkspacesilent, 6"
      # "$mainMod ALT, W, movetoworkspacesilent, 7"
      # "$mainMod ALT, G, movetoworkspacesilent, 8"
      # "$mainMod ALT, M, movetoworkspacesilent, 9"
      "$mainMod ALT, SEMICOLON, movetoworkspacesilent, 6"
      "$mainMod ALT, U, movetoworkspacesilent, 7"
      "$mainMod ALT, O, movetoworkspacesilent, 8"
      "$mainMod ALT, Y, movetoworkspacesilent, 9"

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
      # "$mainMod, 0, workspace, 10"

      # Moving windows to workspaces
      "$mainMod SHIFT, 1, movetoworkspace, 1"
      "$mainMod SHIFT, 2, movetoworkspace, 2"
      "$mainMod SHIFT, 3, movetoworkspace, 3"
      "$mainMod SHIFT, 4, movetoworkspace, 4"
      "$mainMod SHIFT, 5, movetoworkspace, 5"
      "$mainMod SHIFT, 6, movetoworkspace, 6"
      "$mainMod SHIFT, 7, movetoworkspace, 7"
      "$mainMod SHIFT, 8, movetoworkspace, 8"
      "$mainMod SHIFT, 9, movetoworkspace, 9"
      # "$mainMod SHIFT, 0, movetoworkspace, 10"

      # Moving windows to workspaces (silent)
      "$mainMod ALT, 1, movetoworkspacesilent, 1"
      "$mainMod ALT, 2, movetoworkspacesilent, 2"
      "$mainMod ALT, 3, movetoworkspacesilent, 3"
      "$mainMod ALT, 4, movetoworkspacesilent, 4"
      "$mainMod ALT, 5, movetoworkspacesilent, 5"
      "$mainMod ALT, 6, movetoworkspacesilent, 6"
      "$mainMod ALT, 7, movetoworkspacesilent, 7"
      "$mainMod ALT, 8, movetoworkspacesilent, 8"
      "$mainMod ALT, 9, movetoworkspacesilent, 9"
      # "$mainMod ALT, 0, movetoworkspacesilent, 10"
    ];

    binde = [
      # Resizing windows                        X  Y
      # "$mainMod CTRL, COMMA,   resizeactive, -40 0"
      # "$mainMod CTRL, a,       resizeactive,  0  60"
      # "$mainMod CTRL, e,       resizeactive,  0 -60"
      # "$mainMod CTRL, i,       resizeactive,  40 0"
      "$mainMod, Minus,      resizeactive, -40 0"
      "$mainMod, Period,     resizeactive,  0  60"
      "$mainMod, APOSTROPHE, resizeactive,  0 -60"
      "$mainMod, Equal,      resizeactive,  40 0"

      # Moving floating windows       X  Y
      "$mainMod, Left,   moveactive, -40 0"
      "$mainMod, Down,     moveactive,  0  60"
      "$mainMod, Up,  moveactive,  0 -60"
      "$mainMod, Right,   moveactive,  40 0"

      # Switching workspaces
      # "$mainMod, mouse_down, workspace, m-1"
      # "$mainMod, mouse_up, workspace, m+1"
      # "$mainMod CTRL, A, workspace, m-1"
      # "$mainMod CTRL, E, workspace, m+1"
      # "$mainMod, Down, workspace, m-1"
      # "$mainMod, Up, workspace, m+1"
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
