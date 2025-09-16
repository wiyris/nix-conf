{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.services'.dwlb;
  dwlb = pkgs.dwlb.override {
    configH = ./config.h;
  };
in {
  options.services'.dwlb.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    environment.systemPackages = [dwlb];
  };
}
