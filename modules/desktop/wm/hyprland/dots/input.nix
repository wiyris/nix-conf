{
  wayland.windowManager.hyprland.settings = {
    input = {
      follow_mouse = 1;
      sensitivity = 0;
      accel_profile = "flat";
      # force_no_accel = true;

      repeat_delay = 200;

      touchpad = {
        natural_scroll = true;
        disable_while_typing = true;
        scroll_factor = 1;
      };
    };

    device = [
      {
        name = "tpps/2-elan-trackpoint";
        sensitivity = 0.2;
        accel_profile = "adaptive";
      }
      {
        name = "kensington-slimblade-trackball";
        sensitivity = -0.4;
        accel_profile = "flat";
      }
    ];
  };
}
