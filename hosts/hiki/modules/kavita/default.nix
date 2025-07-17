{
  networking.firewall.allowedTCPPorts = [5000];
  services.kavita = {
    enable = true;
    tokenKeyFile = "/var/lib/kavita/token.key";
    settings = {
      Port = 5000;
    };
  };
}
