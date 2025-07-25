{
  lib,
  config,
  ...
}: let
  cfg = config.custom.services.keyd;
in {
  options.custom.services.keyd.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    services.keyd = {
      enable = true;
      keyboards = {
        us = import ./us.nix;
        jis = import ./jis.nix;
      };
    };
  };
}
