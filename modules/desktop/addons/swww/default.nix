{
  lib,
  config,
  ...
}: let
  cfg = config.desktop.swww;
in {
  options.desktop.swww.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {hm.services.swww.enable = true;};
}
