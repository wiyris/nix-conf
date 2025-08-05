{lib, ...}: {
  wayland.windowManager.hyprland.settings.decoration = {
    rounding = 7;
    active_opacity = 1.0;
    inactive_opacity = 1.0;
    fullscreen_opacity = 1.0;
    dim_inactive = true;
    dim_strength = 0.35;

    blur = {
      enabled = true;
      size = 5;
      passes = 3;
      ignore_opacity = true;
      noise = 0.02;
      xray = false;
      popups = true;
      popups_ignorealpha = 0.2;
      new_optimizations = true;
      brightness = 0.9;
      vibrancy = 0.1696;
      vibrancy_darkness = 0.0;
      input_methods = true;
    };

    shadow = {
      enabled = true;
      range = 42;
      render_power = 5;
      ignore_window = true;
      scale = 10;
      # color = lib.mkForce "rgba(f5e0dca7)";
      # color_inactive = lib.mkForce "rgba(363a4f8a)";
    };
  };
}
