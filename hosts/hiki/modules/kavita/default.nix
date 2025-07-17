{
  networking.firewall.allowedTCPPorts = [5000];
  services.kavita = {
    enable = true;
    tokenKeyFile = "/home/tsubaki/kavita-token";
    settings = {
      Port = 5000;
    };
  };
}
