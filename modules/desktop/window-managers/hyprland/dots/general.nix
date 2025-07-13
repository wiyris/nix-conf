{lib, ...}: {
  wayland.windowManager.hyprland.settings.general = {
    allow_tearing = true;
    gaps_in = 5;
    gaps_out = 10;
    border_size = 2;
    layout = "dwindle";
    resize_on_border = true;

    "col.active_border" = lib.mkForce "rgba(f5e0dca7) rgba(eba0aca7) 45deg";
    # "col.inactive_border" = lib.mkForce "rgba(f5e0dc17) rgba(eba0ac17) 45deg";
    # "col.active_border" = "rgba(7fbbb3ee) 45deg";
    # "col.inactive_border" = "rgba(333333ee) 45deg";
  };
}
