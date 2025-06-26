{
  lib,
  config,
  ...
}: let
  cfg = config.desktop.swayosd;
in {
  options.desktop.swayosd.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    hm.services.swayosd = {
      enable = true;
    };
  };
}
