{
  lib,
  pkgs,
  config,
  ...
}: let
  cfg = config.custom.programs.taskwarrior;
in {
  options.custom.programs.taskwarrior.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    hm = {
      programs.taskwarrior = {
        enable = true;
        package = pkgs.taskwarrior3;
      };
    };
  };
}
