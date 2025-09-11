{
  lib,
  config,
  ...
}: let
  cfg = config.custom.programs.rmpc;
in {
  options.custom.programs.rmpc.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    hm'= {
      programs.rmpc = {
        enable = true;
      };
    };
  };
}
