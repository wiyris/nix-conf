{
  services.calibre-server = {
    enable = true;
    openFirewall = true;
    # port = 5072;
  };
  services.calibre-web = {
    enable = true;
    openFirewall = true;
  };
}
