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
      "$launcher" = "rofi -show drun -run-command 'uwsm app -- {cmd}'";
      "$browser" = "${defaultBrowser}";
      "$bar" = "uwsm app -- waybar";
      "$bar-toggle" = "killall -SIGUSR1 .waybar-wrapped";
      "$bar-reload" = "killall .waybar-wrapped; $bar";
      "$explorer" = "${defaultExplorer}";
    }
    // lib.optionalAttrs osConfig.programs'.tofi.isDefault {
      "$launcher" = "pkill tofi || tofi-launcher --uwsm";
    };
}
