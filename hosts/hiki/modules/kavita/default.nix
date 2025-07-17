{
  networking.firewall.allowedTCPPorts = [5000];
  services.kavita = {
    enable = true;
    tokenKeyFile = "/home/tsubaki/kavita-token";
    settings = {
      port = 5000;
    };
  };
}
