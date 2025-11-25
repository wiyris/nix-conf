{
  lib,
  config,
  ...
}:
let
  cfg = config.hardware'.bluetooth;
in
{
  options.hardware'.bluetooth.enable = lib.mkEnableOption { };
  config = lib.mkIf cfg.enable {
    hardware.bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
  };
}
