{
  config,
  lib,
  ...
}:
let
  cfg = config.networking'.iwd;
in
{
  options.networking'.iwd.enable = lib.mkEnableOption { };
  config = lib.mkIf cfg.enable {
    networking = {
      enableIPv6 = false;
      wireless.iwd.enable = true;
    };
  };
}
