{
  lib,
  config,
  ...
}: let
  cfg = config.gaming'.csSource;
in {
  options.gaming'.csSource.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    hm'.home.file.".steam/steam/steamapps/common/Counter-Strike Source/cstrike/cfg" = {
      source = ./cfg;
      recursive = true;
      force = true;
    };
  };
}
