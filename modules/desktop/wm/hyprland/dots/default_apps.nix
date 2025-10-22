{
  lib,
  osConfig,
  ...
}: let
  inherit (osConfig.globals) defaultTerminal defaultBrowser defaultExplorer defaultLauncher;
in {
  wayland.windowManager.hyprland.settings =
    {
      "$mainMod" = "SUPER";
      "$terminal" = "${defaultTerminal}";
      "$editor" = "$terminal -e nvim";
      "$launcher" = "rofi -show drun -run-command 'uwsm app -- {cmd}'";
      "$clipboard" = "cliphist-rofi | rofi -dmenu -theme .config/rofi/theme/cliphist.rasi | cliphist decode | wl-copy";
      "$screenshot" = "pkill rofi || uwsm-app -- screenshot";
      "$browser" = "${defaultBrowser}";
      "$bar" = "uwsm app -- waybar";
      "$bar-toggle" = "killall -SIGUSR1 .waybar-wrapped";
      "$bar-reload" = "killall .waybar-wrapped; $bar";
      "$explorer" = "${defaultExplorer}";
    }
    // lib.optionalAttrs osConfig.programs'.tofi.isDefault {
      "$launcher" = "pkill tofi || tofi-launcher --uwsm";
      "$clipboard" = "pkill tofi || cliphist-rofi list | tofi --width 640 --prompt-text '' | cliphist-rofi decode | wl-copy";
      "$screenshot" = "pkill tofi || uwsm-app -- tofi-screenshot";
    };
}
