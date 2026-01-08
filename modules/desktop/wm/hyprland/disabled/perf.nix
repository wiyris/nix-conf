{
  config,
  lib,
  ...
}:
{
  wayland.windowManager.hyprland.settings = {
    animations.enabled = lib.mkForce false;
    misc.vfr = lib.mkForce true;
    decoration = {
      blur.enabled = lib.mkForce false;
      shadow.enabled = lib.mkForce false;
      rounding = lib.mkForce 0;
      active_opacity = lib.mkForce 1.0;
      inactive_opacity = lib.mkForce 1.0;
      fullscreen_opacity = lib.mkForce 1.0;
      dim_inactive = lib.mkForce false;
    };
    general = {
      border_size = lib.mkForce 2;
      gaps_in = lib.mkForce 0;
      gaps_out = lib.mkForce 0;
      "col.active_border" = lib.mkForce "rgb(${config.lib.stylix.colors.base07})";
      "col.inactive_border" = lib.mkForce "rgb(${config.lib.stylix.colors.base00})";
    };
  };
}
