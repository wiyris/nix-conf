{
  networking = {
    useDHCP = false;
    enableIPv6 = false;
    interfaces.enp24s0 = {
      ipv4.addresses = [
        {
          address = "192.0.0.142";
          prefixLength = 24;
        }
      ];
    };
    defaultGateway = {
      address = "192.0.0.1";
      interface = "enp24s0";
    };
    nameservers = [
      "1.1.1.1"
      "1.0.0.1"
    ];
  };
  services.resolved = {
    enable = true;
    dnssec = "true";
    domains = ["~."];
    fallbackDns = [
      "1.1.1.1"
      "1.0.0.1"
    ];
    dnsovertls = "true";
  };
}
