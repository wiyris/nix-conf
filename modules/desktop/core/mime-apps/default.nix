{
  lib,
  config,
  ...
}: let
  cfg = config.desktop.mime-apps;
in {
  options.desktop.mime-apps.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    hm.xdg.mimeApps.enable = true;
  };
}
