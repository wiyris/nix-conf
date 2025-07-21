{osConfig, ...}: let
  inherit (osConfig.globals) defaultTerminal defaultBrowser;
in {
  wayland.windowManager.hyprland.settings = {
    "$mainMod" = "SUPER";
    "$terminal" = "${defaultTerminal}";
    "$launcher" = "rofi -show drun";
    "$browser" = "${defaultBrowser}";
    "$bar" = "uwsm-app -- waybar";
    "$bar-toggle" = "killall -SIGUSR1 .waybar-wrapped";
    "$bar-reload" = "killall .waybar-wrapped; $bar";
    "$explore" = "thunar";
  };
}
