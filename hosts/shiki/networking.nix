{pkgs, ...}: {
  services = {
    openssh = {
      enable = true;
      ports = [22];
    };
  };

  networking.firewall.allowedTCPPorts = [12315]; # Grayjay Sync
}
