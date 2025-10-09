{
  config,
  lib,
  ...
}: let
  cfg = config.services'.homepage-dashboard;
in {
  options.services'.homepage-dashboard.enable = lib.mkEnableOption {};
  imports = [
    ./bookmarks.nix
    ./services.nix
    ./settings.nix
  ];
  config = lib.mkIf cfg.enable {
    services.homepage-dashboard = {
      enable = true;
      openFirewall = true;
      customCSS = builtins.readFile ./custom.css;
    };
  };
}
