{pkgs, ...}: let
  webuiPort = 8080;
in {
  services.qbittorrent = {
    enable = true;
    openFirewall = true;
    package = pkgs.qbittorrent-nox;
    group = "arr";
    webuiPort = webuiPort;
  };
  systemd.services.qbittorrent.wantedBy = [];
}
