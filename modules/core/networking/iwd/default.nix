{
  config,
  lib,
  ...
}: let
  cfg = config.custom.networking.iwd;
in {
  options.custom.networking.iwd.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    networking = {
      enableIPv6 = false;
      wireless.iwd.enable = true;
    };
  };
}
