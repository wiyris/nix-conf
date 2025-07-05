{
  inputs,
  lib,
  pkgs,
  config,
  ...
}: let
  cfg = config.custom.programs.firefox;
in {
  options.custom.programs.firefox.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    hm = {
      programs.firefox = {
        enable = true;
      };
    };
  };
}
