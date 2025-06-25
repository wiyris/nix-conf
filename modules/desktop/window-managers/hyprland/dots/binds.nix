{
  wayland.windowManager.hyprland.settings = {
    bind = [
      # Apps
      "$mainMod, RETURN, exec, $terminal"
      "$mainMod, J, exec, $browser"
      "$mainMod CTRL, J, exec, $browser -p az"
      "$mainMod, K, exec, $explore"

      # Rofi
      "$mainMod, T, exec, $launcher"
      # "$mainMod, minus, exec, $calculator"
      # "$mainMod, apostrophe, exec, $rofi-scripts/wallpaper/wallpaper"
      # "$mainMod, ESCAPE, exec, $rofi-scripts/powermenu/powermenu"
      # "$mainMod, V, exec, $rofi-scripts/screenshot/screenshot"

      # Bar
      "$mainMod SHIFT, PERIOD, exec, $bar-reload"
      "$mainMod CTRL, PERIOD, exec, $bar-toggle"

      # Misc
      "$mainMod, Q, killactive"
      "$mainMod SHIFT, Q, forcekillactive"
      "$mainMod SHIFT, H, fullscreen"
      "$mainMod, S, togglefloating"
      "$mainMod, V, exec, hyprctl dispatch centerwindow 1"
      # "$mainMod, U, togglesplit"
      # "$mainMod, semicolon, pseudo"
      # "$mainMod, G, exec, gamemode"

      # Group Control
      # "$mainMod, O, togglegroup"
      # "$mainMod SHIFT, O, lockactivegroup, toggle"
      # "$mainMod, TAB, changegroupactive"

      "$mainMod, N, exec, hyprland-scratchpad --raise-or-run-uwsm kitty-scratch $HOME/.config/kitty/scripts/kitty-scratch.sh"

      # Moving focus
      "$mainMod, COMMA, movefocus, l"
      # "$mainMod, a,     movefocus, d"
      # "$mainMod, e,     movefocus, u"
      "$mainMod, i,     movefocus, r"

      "$mainMod, Left,  movefocus, l"
      "$mainMod, Right, movefocus, r"

      # Moving windows
      "$mainMod SHIFT, COMMA,  swapwindow, l"
      "$mainMod SHIFT, a,      swapwindow, d"
      "$mainMod SHIFT, e,      swapwindow, u"
      "$mainMod SHIFT, i,      swapwindow, r"

      # Resizeing windows                     X  Y
      "$mainMod, Minus,        resizeactive, -40 0"
      "$mainMod CTRL, a,       resizeactive,  0  60"
      "$mainMod CTRL, e,       resizeactive,  0 -60"
      "$mainMod, Equal,        resizeactive,  40 0"

      # Switching workspaces
      "$mainMod, mouse_down, workspace, m-1"
      "$mainMod, mouse_up, workspace, m+1"
      "$mainMod, A, workspace, m-1"
      "$mainMod, E, workspace, m+1"
      "$mainMod, Down, workspace, m-1"
      "$mainMod, Up, workspace, m+1"

      "$mainMod, F, workspace, 1"
      "$mainMod, P, workspace, 2"
      "$mainMod, D, workspace, 3"
      "$mainMod, L, workspace, 4"
      "$mainMod, X, workspace, 5"
      "$mainMod, SEMICOLON, workspace, 6"
      "$mainMod, U, workspace, 7"
      "$mainMod, O, workspace, 8"
      "$mainMod, Y, workspace, 9"
      "$mainMod, B, workspace, 10"

      # Moving windows to workspaces
      "$mainMod SHIFT, F, movetoworkspace, 1"
      "$mainMod SHIFT, P, movetoworkspace, 2"
      "$mainMod SHIFT, D, movetoworkspace, 3"
      "$mainMod SHIFT, L, movetoworkspace, 4"
      "$mainMod SHIFT, X, movetoworkspace, 5"
      "$mainMod SHIFT, SEMICOLON, movetoworkspace, 6"
      "$mainMod SHIFT, U, movetoworkspace, 7"
      "$mainMod SHIFT, O, movetoworkspace, 8"
      "$mainMod SHIFT, Y, movetoworkspace, 9"
      "$mainMod SHIFT, B, movetoworkspace, 10"

      # Moving windows to workspaces (silent)
      "$mainMod ALT, F, movetoworkspacesilent, 1"
      "$mainMod ALT, P, movetoworkspacesilent, 2"
      "$mainMod ALT, D, movetoworkspacesilent, 3"
      "$mainMod ALT, L, movetoworkspacesilent, 4"
      "$mainMod ALT, X, movetoworkspacesilent, 5"
      "$mainMod ALT, SEMICOLON, movetoworkspacesilent, 6"
      "$mainMod ALT, U, movetoworkspacesilent, 7"
      "$mainMod ALT, O, movetoworkspacesilent, 8"
      "$mainMod ALT, Y, movetoworkspacesilent, 9"
      "$mainMod ALT, B, movetoworkspacesilent, 10"
    ];

    # Laptop multimedia keys for volume and LCD brightness
    bindel = [
      ", XF86AudioRaiseVolume,  exec, swayosd-client --output-volume +5"
      ", XF86AudioLowerVolume,  exec, swayosd-client --output-volume -5"
      ", XF86AudioMute,         exec, swayosd-client --output-volume mute-toggle"
      ", XF86AudioMicMute,      exec, swayosd-client --input-volume mute-toggle"
      # ", XF86MonBrightnessUp,   exec, swayosd-client --brightness +10"
      # ", XF86MonBrightnessDown, exec, swayosd-client --brightness -10"
      ", XF86MonBrightnessDown, exec, hyprctl hyprsunset gamma -10"
      ", XF86MonBrightnessUp, exec, hyprctl hyprsunset gamma +10"
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
