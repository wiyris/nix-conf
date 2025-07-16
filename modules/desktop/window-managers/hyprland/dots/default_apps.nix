{
  wayland.windowManager.hyprland.settings = {
    "$mainMod" = "SUPER";
    "$terminal" = "kitty";
    "$launcher" = "rofi -show drun";
    "$browser" = "zen-beta";
    "$bar" = "waybar";
    "$bar-toggle" = "killall -SIGUSR1 .waybar-wrapped";
    "$bar-reload" = "killall .waybar-wrapped; $bar";
    "$explore" = "thunar";
  };
}
