{
  config,
  lib,
  ...
}: let
  cfg = config.custom.networking.networkmanager;
in {
  options.custom.networking.networkmanager.enable = lib.mkEnableOption {};

  config = lib.mkIf cfg.enable {
    custom.user.extraGroups = ["networkmanager"];

    networking.networkmanager = {
      enable = true;
      # increase boot speed
      wifi.backend = lib.mkIf config.custom.networking.iwd.enable "iwd";
    };
  };
}
