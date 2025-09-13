{
  config,
  lib,
  ...
}: let
  cfg = config.custom.security.polkit;
in {
  options.custom.security.polkit.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    services.dbus.enable = lib.mkDefault true;
    security.polkit.enable = true;
  };
}
