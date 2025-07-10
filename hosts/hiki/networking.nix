{
<<<<<<< HEAD
  networking = {
    enableIPv6 = false;
    interfaces.enp24s0 = {
      ipv4.addresses = [
        {
          address = "192.0.1.142";
          prefixLength = 24;
        }
      ];
    };
    defaultGateway = {
      address = "192.0.0.1";
      interface = "enp24s0";
=======
  networking.networkmanager.enable = false;
  systemd.network.enable = true;
  systemd.network.networks."10-lan" = {
    matchConfig.Name = "eth0";
    networkConfig = {
      DHCP = "no";
      Address = "192.168.1.100/24";
      Gateway = "192.168.1.1";
      DNS = ["8.8.8.8" "1.1.1.1"];
>>>>>>> d0bfc20 (test)
    };
    nameservers = [
      "1.1.1.1"
      "1.0.0.1"
    ];
  };
}
