{
  lib,
  pkgs,
  config,
  ...
}: let
  cfg = config.gaming.lutris;
in {
  options.gaming.lutris.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    hm.programs.lutris = {
      enable = true;
      protonPackages = pkgs.proton-ge-bin;
    };
  };
}
