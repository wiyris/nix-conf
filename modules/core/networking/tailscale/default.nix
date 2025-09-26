{
  lib,
  config,
  ...
}: let
  cfg = config.networking'.tailscale;
in {
  options.networking'.tailscale.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    # used by tailscale for exit node
    boot.kernel.sysctl = {
      "net.ipv4.ip_forward" = true;
      "net.ipv6.conf.all.forwarding" = true;
    };

    networking.firewall.trustedInterfaces = ["tailscale0"];

    # inter-machine VPN
    services.tailscale = {
      enable = true;
      openFirewall = true;
      useRoutingFeatures = "both";
    };
  };
}
