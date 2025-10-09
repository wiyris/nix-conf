{
  config,
  lib,
  ...
}: let
  cfg = config.services'.homepage-dashboard;
in {
  options.services'.homepage-dashboard.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    services.homepage-dashboard = {
      enable = true;
      openFirewall = true;

      settings = import ./settings.nix;
      # services = import ./services.nix;
      bookmarks = import ./bookmarks.nix;
      customCSS = builtins.readFile ./custom.css;
    };
  };
}
