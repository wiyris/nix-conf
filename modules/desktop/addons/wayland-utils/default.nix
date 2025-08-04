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
      home.packages = with pkgs; [
        wl-clipboard-rs
        hyprshot
        playerctl
        wev
        xwayland-satellite
      ];
    };
  };
}
