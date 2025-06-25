{
  lib,
  config,
  ...
}: let
  cfg = config.custom.programs.mpv;
in {
  options.custom.programs.mpv.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    hm.programs.mpv.enable = true;
  };
}
