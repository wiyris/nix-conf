{config, ...}: {
  services.homepage-dashboard.services = [
    {
      "Media" = [
        {
          "Jellyfin" = {
            icon = "";
            href = "http://192.168.0.42:8096";
          };
        }
        {
          "kavita" = {
            icon = "";
            href = "http://192.168.0.42:5005";
            # key = config.sops.secrets.kavita-token.path;
          };
        }
      ];
    }
  ];
}
