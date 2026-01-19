{
  wayland.windowManager.hyprland.settings = {
    input = {
      follow_mouse = 1;
      sensitivity = 0;
      accel_profile = "flat";
      # force_no_accel = true;

      repeat_rate = 40;
      repeat_delay = 200;

      touchpad = {
        natural_scroll = true;
        disable_while_typing = true;
        scroll_factor = 1;
      };
    };

    device = [
      {
        name = "kensington-slimblade-trackball";
        sensitivity = 0.3;
        accel_profile = "flat";
      }
    ];
  };
}
