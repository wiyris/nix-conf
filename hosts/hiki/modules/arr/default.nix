{pkgs, ...}: {
  services = {
    lidarr = {
      enable = true;
      openFirewall = true;
    };
    radarr = {
      enable = true;
      openFirewall = true;
    };
    readarr = {
      enable = true;
      openFirewall = true;
    };
    sonarr = {
      enable = true;
      openFirewall = true;
    };
    prowlarr = {
      enable = true;
      openFirewall = true;
    };
    flaresolverr = {
      enable = true;
      openFirewall = true;
    };
    bazarr = {
      enable = true;
      openFirewall = true;
    };
    qbittorrent = {
      enable = true;
      openFirewall = true;
      package = pkgs.qbittorrent-nox;
    };
  };
  systemd.services.qbittorrent.wantedBy = [];
}
