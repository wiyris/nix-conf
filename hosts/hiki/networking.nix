{
  systemd.network.enable = true;
  systemd.network.networks."10-lan" = {
    matchConfig.Name = "enp24s0";
    networkConfig = {
      DHCP = "no";
      Address = "192.168.1.142/24";
      Gateway = "192.168.0.1";
      DNS = ["1.1.1.1" "1.0.0.1"];
    };
  };
}
