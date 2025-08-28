{
  services.navidrome = {
    enable = true;
    openFirewall = true;
    settings = {
      Address = "0.0.0.0";
      Port = 4533;
      Bandcamp = "/mnt/Music/Bandcamp";
      sc-dump = "/mnt/sc";
      EnableInsightsCollector = false;
    };
  };
}
