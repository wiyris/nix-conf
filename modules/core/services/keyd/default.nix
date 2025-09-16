{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.custom.services.keyd;
in {
  options.custom.services.keyd.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    systemd.services.keyd = {
      wantedBy = lib.mkForce [];
      serviceConfig.Restart = lib.mkForce "on-failure";
    };
    environment.systemPackages = [pkgs.keyd];
    services.keyd = {
      enable = true;
      keyboards = {
        us = import ./us.nix;
        jis = import ./jis.nix;
      };
    };
  };
}
