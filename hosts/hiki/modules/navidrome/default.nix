{
  services.navidrome = {
    enable = true;
    openFirewall = true;
    settings = {
      Address = "0.0.0.0";
      Port = 4533;
      MusicFolder = "/mnt/Music";
      EnableInsightsCollector = false;
    };
  };
}
