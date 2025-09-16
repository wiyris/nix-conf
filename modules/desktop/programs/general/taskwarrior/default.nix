{
  lib,
  pkgs,
  config,
  ...
}: let
  cfg = config.programs'.taskwarrior;
in {
  options.programs'.taskwarrior.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    hm'= {
      programs.taskwarrior = {
        enable = true;
        package = pkgs.taskwarrior3;
      };
    };
  };
}
