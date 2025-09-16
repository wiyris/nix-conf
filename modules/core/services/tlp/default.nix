{
  lib,
  config,
  ...
}: let
  cfg = config.services'.tlp;
in {
  options.services'.tlp.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    services.tlp = {
      enable = true;
    };
  };
}
