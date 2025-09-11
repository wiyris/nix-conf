{pkgs, ...}: let
  dwlb = pkgs.dwlb.override {
    configH = ./config.h;
  };
in {
  environment.systemPackages = [
    dwlb
  ];
}
