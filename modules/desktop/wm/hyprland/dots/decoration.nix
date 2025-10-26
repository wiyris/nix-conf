{lib, ...}: {
  wayland.windowManager.hyprland.settings.decoration = {
    rounding = 10;
    active_opacity = 1.0;
    inactive_opacity = 0.8;
    fullscreen_opacity = 1.0;
    dim_inactive = true;
    dim_strength = 0.1;

    blur = {
      enabled = true;
      size = 10;
      passes = 4;
      ignore_opacity = true;
      noise = 0.03;
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
      range = 20;
      render_power = 4;
      ignore_window = true;
      scale = 1.0;
      # color = lib.mkForce "rgba(181825EE)";
      # color_inactive = lib.mkForce "rgba(181825EE)";
    };
  };
}
