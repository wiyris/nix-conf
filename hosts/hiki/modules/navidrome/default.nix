{
  services.navidrome = {
    enable = true;
    openFirewall = true;
    settings = {
      Port = 4533;
      MusicFolder = "/mnt/stuff/weeb";
      EnableInsightsCollector = false;
    };
  };
}
