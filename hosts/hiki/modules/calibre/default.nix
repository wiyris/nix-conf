{
  services.calibre-server = {
    enable = true;
    openFirewall = true;
    port = 5072;
    libraries = ["/mnt/lib"];
  };
  services.calibre-web = {
    enable = true;
    openFirewall = true;
  };
}
