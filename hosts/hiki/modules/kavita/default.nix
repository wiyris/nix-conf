{config, ...}: let
  servicePort = 5005;
in {
  networking.firewall.allowedTCPPorts = [servicePort];
  services.kavita = {
    enable = true;
    tokenKeyFile = "config.sops.secrets.kavita.path";
    settings = {
      Port = "${servicePort}";
    };
  };

  sops.secrets.kavita-secret = {
    owner = "kavita";
    group = "kavita";
    sopsFile = ../../../../secrets/secrets.yml;
  };
}
