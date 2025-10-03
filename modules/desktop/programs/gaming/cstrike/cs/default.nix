{
  lib,
  config,
  ...
}: let
  cfg = config.gaming'.cs;
in {
  options.gaming'.cs.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    hm'.home.file.".steam/steam/steamapps/common/Half-Life/cstrike" = {
      source = ./cfg;
      recursive = true;
      force = true;
    };
  };
}
