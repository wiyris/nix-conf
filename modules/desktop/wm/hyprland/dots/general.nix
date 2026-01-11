{
  lib,
  config,
  ...
}:
{
  wayland.windowManager.hyprland.settings.general = {
    allow_tearing = true;
    gaps_in = 9;
    gaps_out = 18;
    border_size = 0;
    layout = "master";
    resize_on_border = true;

    # "col.active_border" = lib.mkForce "rgb(${config.lib.stylix.colors.base07})";
    # "col.active_border" = lib.mkForce "rgba(${config.lib.stylix.colors.base07}ee)";
    # "col.active_border" = lib.mkForce "rgba(f5c2e7ee) rgba(eba0acaa) 45deg";
    # "col.active_border" = lib.mkForce "rgba(f5c2e7aa)";
    # "col.inactive_border" = lib.mkForce "rgba(1e1e2e15)";
  };
}
