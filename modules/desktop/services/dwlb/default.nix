{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.custom.services.dwlb;
  dwlb = pkgs.dwlb.override {
    configH = ./config.h;
  };
in {
  options.custom.services.dwlb.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    environment.systemPackages = [dwlb];
  };
}
