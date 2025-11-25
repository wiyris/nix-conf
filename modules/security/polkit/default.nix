{
  config,
  lib,
  ...
}:
let
  cfg = config.security'.polkit;
in
{
  options.security'.polkit.enable = lib.mkEnableOption { };
  config = lib.mkIf cfg.enable {
    services.dbus.enable = lib.mkDefault true;
    security.polkit.enable = true;
  };
}
