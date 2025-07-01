{
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
}
