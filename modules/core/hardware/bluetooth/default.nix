{
  lib,
  config,
  ...
}: let
  cfg = config.custom.hardware.bluetooth;
in {
  options.custom.hardware.bluetooth.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    hardware.bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
  };
}
