{
  lib,
  pkgs,
  config,
  ...
}: let
  cfg = config.custom.programs.chromium;
in {
  options.custom.programs.chromium.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    hm.programs.chromium = {
      enable = true;
      package = pkgs.ungoogled-chromium;
    };
  };
}
