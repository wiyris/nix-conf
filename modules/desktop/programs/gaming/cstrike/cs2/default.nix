{
  lib,
  config,
  ...
}:
let
  cfg = config.gaming'.cs2;
in
{
  options.gaming'.cs2.enable = lib.mkEnableOption { };
  config = lib.mkIf cfg.enable {
    hm'.home.file.".steam/steam/steamapps/common/Counter-Strike Global Offensive/game/csgo/cfg" = {
      source = ./cfg;
      recursive = true;
      force = true;
    };
  };
}
