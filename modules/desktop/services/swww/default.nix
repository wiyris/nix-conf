{
  lib,
  config,
  ...
}: let
  cfg = config.custom.services.swww;
in {
  options.custom.services.swww.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {hm.services.swww.enable = true;};
}
