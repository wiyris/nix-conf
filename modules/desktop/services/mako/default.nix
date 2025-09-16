{
  config,
  lib,
  ...
}: let
  cfg = config.services'.mako;
  inherit
    (config.lib.stylix.colors.withHashtag)
    base07
    base08
    ;
in {
  options.services'.mako.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    hm'.services.mako = {
      enable = true;
      settings = {
        border-size = 1;
        margin = 10;
        height = 200;
        border-radius = 0;
        default-timeout = 10000;
        "urgency=low" = {
          default-timeout = 6000;
          border-color = lib.mkForce base07;
        };
        "urgency=high" = {
          default-timeout = 10000;
        };
        "urgency=critical" = {
          default-timeout = 0;
          border-color = lib.mkForce base08;
        };
      };
    };
  };
}
