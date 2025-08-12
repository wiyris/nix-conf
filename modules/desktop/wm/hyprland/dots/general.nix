{
  lib,
  config,
  ...
}: {
  wayland.windowManager.hyprland.settings.general = {
    allow_tearing = true;
    gaps_in = 5;
    gaps_out = 10;
    border_size = 2;
    layout = "dwindle";
    resize_on_border = true;

    # "col.active_border" = lib.mkForce "rgba(${config.lib.stylix.colors.base0E}69)";

    # "col.active_border" = lib.mkForce "rgba(f5c2e769) rgba(cba6f769) rgba(f38ba869) rgba(a6e3a169) rgba(94e2d569) rgba(89dceb69) rgba(74c7ec69) rgba(89b4fa69) rgba(b4befe69) 45deg";
    # "col.active_border" = lib.mkForce "rgba(f5e0dc69) rgba(eba0ac69) 45deg";
    # "col.inactive_border" = lib.mkForce "rgba(f5e0dc17) rgba(eba0ac17) 45deg";
  };
}
