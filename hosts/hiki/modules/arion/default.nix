{
  pkgs,
  config,
  ...
}: let
  inherit (config.globals) userName;
in {
  environment.systemPackages = with pkgs; [
    arion

    # Do install the docker CLI to talk to podman.
    # Not needed when virtualisation.docker.enable = true;
    docker-client
  ];

  virtualisation.docker.enable = false;
  virtualisation.podman.enable = true;
  virtualisation.podman.dockerSocket.enable = true;
  # virtualisation.podman.defaultNetwork.dnsname.enable = true;

  users.extraUsers.${userName}.extraGroups = ["podman"];
}
