{
  wayland.windowManager.hyprland.settings = {
    input = {
      follow_mouse = 1;
      sensitivity = 0;
      accel_profile = "flat";

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
        accel_profile = "flat";
      }
    ];
  };
}
