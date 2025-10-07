{
  config,
  lib,
  ...
}: let
  cfg = config.services'.homepage-dashboard;
  inherit (config.globals) configDirectory;
in {
  options.services'.homepage-dashboard.enable = lib.mkEnableOption {};
  imports = [
    ./settings.nix
  ];
  config = lib.mkIf cfg.enable {
    services.homepage-dashboard = {
      enable = true;
      openFirewall = true;
      settings = import ./settings.nix;
      # services = [];
      bookmarks = import ./bookmarks.nix;
      customCSS = builtins.readFile ./custom.css;
    };
  };
}
