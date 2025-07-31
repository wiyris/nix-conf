{
  lib,
  config,
  ...
}: let
  cfg = config.custom.services.tlp;
in {
  options.custom.services.tlp.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    services.tlp = {
      enable = true;
    };
  };
}
