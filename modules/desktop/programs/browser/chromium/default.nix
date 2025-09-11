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
    stylix.targets.chromium.enable = false;
    # TODO: setup ungoogled-chromium extensions w/ home-manager
    # guide: https://gist.github.com/MaximilianGaedig/acbce27522c997e9666bd93cef77492d
    hm'.programs.chromium = {
      enable = true;
      package = pkgs.ungoogled-chromium;
    };
  };
}
