{
  config,
  pkgs,
  lib,
  ...
}: let
  cfg = config.desktop.wayland-utils;
in {
  options.desktop.wayland-utils.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    hm = {
      services.swayosd.enable = true;
      home.packages = with pkgs; [
        wl-clipboard-rs
        rofi-wayland
        hyprshot
        playerctl
        wev
      ];
    };
  };
}
