{lib, ...}: {
  wayland.windowManager.hyprland.settings.decoration = {
    rounding = 7;
    active_opacity = 1.0;
    inactive_opacity = 1.0;
    fullscreen_opacity = 1.0;
    # dim_inactive = true;

    blur = {
      enabled = true;
      size = 2;
      passes = 3;
      ignore_opacity = true;
      noise = 0.0;
      xray = false;
      popups = true;
      new_optimizations = true;
    };

    shadow = {
      enabled = false;
      range = 45;
      render_power = 10;
      ignore_window = true;
      scale = 10;
      # color = lib.mkForce "rgba(f5e0dca7)";
      # color_inactive = lib.mkForce "rgba(363a4f8a)";
    };
  };
}
