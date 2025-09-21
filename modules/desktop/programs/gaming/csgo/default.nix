{
  lib,
  config,
  ...
}: let
  cfg = config.gaming'.csgo;
in {
  options.gaming'.csgo.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    hm'.home.file.".steam/steam/steamapps/common/Counter-Strike Global Offensive/csgo/cfg" = {
      source = ./cfg;
      recursive = true;
      force = true;
    };
  };
}
