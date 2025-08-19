{pkgs, ...}: {
  users.groups.arr = {};
  services.transmission.settings.umask = "0002";
  services = {
    lidarr = {
      enable = true;
      openFirewall = true;
      group = "arr";
    };
    radarr = {
      enable = true;
      openFirewall = true;
      group = "arr";
    };
    readarr = {
      enable = true;
      openFirewall = true;
      group = "arr";
    };
    sonarr = {
      enable = true;
      openFirewall = true;
      group = "arr";
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
      group = "arr";
    };
    qbittorrent = {
      enable = true;
      openFirewall = true;
      package = pkgs.qbittorrent-nox;
      group = "arr";
    };
  };
  systemd.services.qbittorrent.wantedBy = [];
}
