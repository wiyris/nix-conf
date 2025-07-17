{
  networking.firewall.allowedTCPPorts = [5000];
  services.kavita = {
    enable = true;
    tokenKeyFile = "/etc/kavita-token";
    settings = {
      port = 5000;
    };
  };
}
