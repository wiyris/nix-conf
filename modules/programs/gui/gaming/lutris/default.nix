{
  lib,
  config,
  ...
}: let
  cfg = config.gaming.lutris;
in {
  options.gaming.luris.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    hm.programs.lutris = {
      enable = true;
    };
  };
}
