{lib, ...}: {
  wayland.windowManager.hyprland.settings.decoration = {
    rounding = 0;
    active_opacity = 1.0;
    inactive_opacity = 1.0;
    fullscreen_opacity = 1.0;
    # dim_inactive = true;
    # dim_strength = 0.2;

    blur = {
      enabled = false;
      size = 5;
      passes = 4;
      ignore_opacity = true;
      noise = 0.02;
      xray = false;
      popups = true;
      popups_ignorealpha = 0.2;
      new_optimizations = true;
      brightness = 0.85;
      vibrancy = 0.1696;
      vibrancy_darkness = 0.0;
      input_methods = true;
    };

    shadow = {
      enabled = true;
      range = 42;
      render_power = 3;
      ignore_window = true;
      scale = 1.0;
      color = lib.mkForce "rgba(181825EE)";
      color_inactive = lib.mkForce "rgba(181825EE)";
    };
  };
}
