{
  lib,
  config,
  ...
}: let
  cfg = config.custom.programs.foot;
in {
  options.custom.programs.foot.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    hm.programs.foot = {
      enable = true;
      settings = {
        main = {
          pad = "4x0";
        };
      };
    };
  };
}
