{
  config,
  osConfig,
  ...
}:
let
  inherit (osConfig.globals) defaultTerminal defaultBrowser;
in
{
  programs.niri.settings.binds = with config.lib.niri.actions; {
    "Mod+Return".action = spawn "uwsm-app" "--" "${defaultTerminal}";
    "Mod+Backspace".action = spawn "uwsm-app" "--" "${defaultTerminal}" "-e" "nvim";
    "Mod+J".action = spawn "uwsm-app" "--" "${defaultBrowser}";
    "Mod+C".action = spawn "rofi" "-show" "drun";
    # "Mod+K".action =
    #   spawn "rofi" "-dmenu" "-theme" ".config/rofi/theme/cliphist.rasi" "|" "cliphist" "decode" "|"
    #     "wl-copy";
    # "Mod+Shift+W".action = spawn "uwsm-app" "--" "wallpaper";
    "Mod+M".action = spawn "uwsm-app" "--" "thunar";
    # "Print".action = screenshot;
    # "Mod+Shift+Period".action = spawn "sh" "-c" "killall -SIGUSR1 .waybar-wrapped"; # toggle waybar
    # "Mod+Ctrl+Period".action = spawn "sh" "-c" "killall .waybar-wrapped; waybar"; # reload waybar

    "Mod+Q".action = close-window;
    "Mod+MouseMiddle".action = close-window;

    "Mod+R".action = switch-preset-column-width;
    "Mod+Shift+R".action = switch-preset-window-height;
    "Mod+Ctrl+R".action = reset-window-height;

    "Mod+F".action = maximize-column;
    "Mod+Shift+F".action = fullscreen-window;

    "Mod+Slash".action = toggle-overview;

    "Mod+V".action = toggle-window-floating;
    "Mod+Shift+V".action = center-column;
    # "Mod+N".action = switch-focus-between-floating-and-tiling;

    "Mod+Minus".action = set-column-width "-5%";
    "Mod+Equal".action = set-column-width "+5%";
    "Mod+Shift+Minus".action = set-window-height "-5%";
    "Mod+Shift+Equal".action = set-window-height "+5%";

    # "Mod+Apostrophe".action = consume-window-into-column;
    # "Mod+Period".action = expel-window-from-column;
    # "Mod+Shift+Apostrophe".action = consume-or-expel-window-left;
    # "Mod+Shift+Period".action = consume-or-expel-window-right;

    "Mod+H".action = focus-column-left;
    "Mod+T".action = focus-window-or-workspace-down;
    "Mod+N".action = focus-window-or-workspace-up;
    "Mod+S".action = focus-column-right;
    "Mod+Left".action = focus-column-left;
    "Mod+Down".action = focus-window-or-workspace-down;
    "Mod+Up".action = focus-window-or-workspace-up;
    "Mod+Right".action = focus-column-right;

    "Mod+Shift+H".action = move-column-left;
    "Mod+Shift+T".action = move-window-down-or-to-workspace-down;
    "Mod+Shift+N".action = move-window-up-or-to-workspace-up;
    "Mod+Shift+S".action = move-column-right;
    "Mod+Shift+Left".action = move-column-left;
    "Mod+Shift+Down".action = move-window-down-or-to-workspace-down;
    "Mod+Shift+Up".action = move-window-up-or-to-workspace-up;
    "Mod+Shift+Right".action = move-column-right;

    "Mod+0".action = focus-column-first;
    "Mod+Dollar".action = focus-column-last;
    "Mod+Shift+0".action = move-column-to-first;
    "Mod+Shift+Dollar".action = move-column-to-last;

    "Mod+WheelScrollDown".action = focus-window-or-workspace-down;
    "Mod+WheelScrollUp".action = focus-window-or-workspace-up;
    "Mod+Shift+WheelScrollDown".action = move-window-down-or-to-workspace-down;
    "Mod+Shift+WheelScrollUp".action = move-window-up-or-to-workspace-up;
    "Mod+Ctrl+WheelScrollDown".action = focus-column-right;
    "Mod+Ctrl+WheelScrollUp".action = focus-column-left;

    "XF86AudioRaiseVolume".action = spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "5%+";
    "XF86AudioLowerVolume".action = spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "5%-";
    "XF86AudioMute".action = spawn "wpctl" "set-mute" "@DEFAULT_AUDIO_SINK@" "toggle";
    "XF86AudioMicMute".action = spawn "wpctl" "set-mute" "@DEFAULT_AUDIO_SOURCE@" "toggle";
    "XF86AudioNext".action = spawn "playerctl" "next";
    "XF86AudioPause".action = spawn "playerctl" "play-pause";
    "XF86AudioPlay".action = spawn "playerctl" "play-pause";
    "XF86AudioPrev".action = spawn "playerctl" "previous";
  };
}
