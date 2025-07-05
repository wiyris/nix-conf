{
  inputs,
  lib,
  pkgs,
  config,
  ...
}: let
  cfg = config.custom.programs.zen;
in {
  options.custom.programs.zen.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    hm = {
      programs.firefox = {
        enable = true;
      };
    };
  };
}
