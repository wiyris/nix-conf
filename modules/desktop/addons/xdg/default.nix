{
  lib,
  pkgs,
  config,
  ...
}: let
  cfg = config.desktop.xdg;
in {
  options.desktop.xdg.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    hm.xdg.portal = {
      enable = true;
      config.common.default = "gtk";
      extraPortals = [pkgs.xdg-desktop-portal-gtk];
      xdgOpenUsePortal = true;
    };
  };
}
