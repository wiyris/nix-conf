{
  lib,
  config,
  ...
}: let
  cfg = config.services'.swww;
in {
  options.services'.swww.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {hm'.services.swww.enable = true;};
}
