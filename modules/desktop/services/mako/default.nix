{
  config,
  pkgs,
  lib,
  ...
}: let
  cfg = config.custom.services.mako;
  inherit
    (config.lib.stylix.colors.withHashtag)
    base00
    base02
    base03
    base05
    base07
    base08
    base0E
    ;
in {
  options.custom.services.mako.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    hm.services.mako = {
      enable = true;
    };
  };
}
