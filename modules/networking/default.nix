{
  networking = {
    dhcpcd.wait = "background";
    enableIPv6 = false;
    firewall = {
      enable = true;
      allowedTCPPorts = [
        12315 # Grayjay Sync
      ];
      allowPing = true;
    };
    hosts = {
      "192.168.0.42" = [ "hiki" ];
    };
  };
}
