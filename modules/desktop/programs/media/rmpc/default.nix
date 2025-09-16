{
  lib,
  config,
  ...
}: let
  cfg = config.programs'.rmpc;
in {
  options.programs'.rmpc.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    hm'= {
      programs.rmpc = {
        enable = true;
      };
    };
  };
}
