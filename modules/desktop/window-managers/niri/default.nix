{
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.desktop.niri;
in {
  options.desktop.niri.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    environment.systemPackages = [pkgs.xwayland-satellite];
    programs = {
      niri.enable = true;
      uwsm.waylandCompositors.niri = {
        prettyName = "Niri";
        comment = "Niri managed by UWSM";
        binPath = "/run/current-system/sw/bin/niri-session";
      };
    };
  };
}
