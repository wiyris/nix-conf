{
  lib,
  config,
  ...
}: let
  cfg = config.custom.services.batsignal;
in {
  options.custom.services.batsignal.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    hm.services.batsignal.enable = true;
  };
}
