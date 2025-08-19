{
  lib,
  config,
  ...
}: {
  wayland.windowManager.hyprland.settings = {
    "$terminal" = lib.mkForce "foot";
    animations.enabled = lib.mkForce false;
    misc.vfr = lib.mkForce true;
    decoration = {
      blur.enabled = lib.mkForce false;
      shadow.enabled = lib.mkForce false;
      rounding = lib.mkForce 0;
      # active_opacity = lib.mkForce 1.0;
      # inactive_opacity = lib.mkForce 1.0;
      # fullscreen_opacity = lib.mkForce 1.0;
      # dim_inactive = lib.mkForce true;
    };
    general = {
      "col.active_border" = lib.mkForce "rgb(${config.lib.stylix.colors.base0E})";
      gaps_in = lib.mkForce 0;
      gaps_out = lib.mkForce 0;
      allow_tearing = lib.mkForce false;
      border_size = 0;
    };
    unbind = [
      "$mainMod, S"
      "$mainMod, M"
      "$mainMod, K"
      "$mainMod, G"
      "$mainMod, SLASH"
    ];
  };
}
