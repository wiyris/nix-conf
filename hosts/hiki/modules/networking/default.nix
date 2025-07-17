{
  networking = {
    enableIPv6 = false;
    interfaces.enp24s0.ipv4.addresses = [
      {
        address = "192.168.0.42";
        prefixLength = 24;
      }
    ];
    defaultGateway = "192.168.0.1";
    nameservers = ["192.168.0.1"];
  };
  services.openssh.enable = true;
}
