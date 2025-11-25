{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.services'.cliphist;
in
{
  options.services'.cliphist.enable = lib.mkEnableOption [ ];
  config = lib.mkIf cfg.enable {
    hm'.services.cliphist = {
      enable = true;
      # allowImages = false;
    };
  };
}
