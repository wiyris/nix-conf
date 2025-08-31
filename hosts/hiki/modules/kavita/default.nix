{config, ...}: let
  servicePort = 5005;
in {
  networking.firewall.allowedTCPPorts = [servicePort];
  services.kavita = {
    enable = true;
    tokenKeyFile = config.sops.secrets.kavita-token.path;
    settings = {
      Port = servicePort;
    };
  };

  sops.secrets.kavita-token = {
    owner = "kavita";
    group = "kavita";
    sopsFile = ../../../../secrets/secrets.yaml;
  };
}
