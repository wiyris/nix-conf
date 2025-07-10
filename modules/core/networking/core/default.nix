{
  config,
  lib,
  ...
}: let
  cfg = config.custom.networking.core;
in {
  options.custom.networking.core.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    services.openssh.enable = true;
    networking = {
      dhcpcd.wait = "background";
      enableIPv6 = false;
      firewall = {
        enable = true;
        allowedTCPPorts = [12315]; # Grayjay Sync
        allowPing = true;
        allowedTCPPortRanges = [
        ];
      };
    };
  };
}
