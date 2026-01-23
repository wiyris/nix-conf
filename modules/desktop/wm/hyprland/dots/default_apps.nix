{
  lib,
  osConfig,
  ...
}:
let
  inherit (osConfig.globals)
    defaultTerminal
    defaultBrowser
    defaultExplorer
    defaultLauncher
    ;
in
{
  wayland.windowManager.hyprland.settings = {
    # "$terminal" = "${defaultTerminal}";
    "$terminal" = "footclient";
    "$editor" = "$terminal -e nvim";
    "$screenshot" = "pkill rofi || uwsm-app -- screenshot";
    "$bar" = "waybar";
    "$bar-toggle" = "killall -SIGUSR1 .waybar-wrapped";
    "$bar-reload" = "killall .waybar-wrapped; $bar";
    "$explorer" = "${defaultExplorer}";
    "$browser" = "${defaultBrowser}";

    "$launcher" = "rofi -show drun -run-command 'uwsm app -- {cmd}'";
    # "$clipboard" = "cliphist-rofi | rofi -dmenu -theme .config/rofi/theme/cliphist.rasi | cliphist decode | wl-copy";
    "$clipboard" =
      "stash list | rofi -dmenu -theme .config/rofi/theme/cliphist.rasi | stash decode | wl-copy";
    "$wallpaper" = "wallpaper";

    # "$launcher" = "noctalia-shell ipc call launcher toggle";
    # "$wallpaper" = "noctalia-shell ipc call wallpaper toggle";
    # "$clipboard" = "noctalia-shell ipc call launcher clipboard";
    # "$emoji" = "noctalia-shell ipc call launcher emoji";
    # "$logout" = "noctalia-shell ipc call sessionMenu toggle";
    # "$notify" = "noctalia-shell ipc call notifications toggleHistory";
  }
  // lib.optionalAttrs osConfig.programs'.tofi.isDefault {
    "$launcher" = "pkill tofi || tofi-launcher --uwsm";
    "$clipboard" =
      "pkill tofi || cliphist-rofi | tofi --width 640 --prompt-text '' | cliphist decode | wl-copy";
    "$screenshot" = "pkill tofi || uwsm-app -- tofi-screenshot";
  };
}
