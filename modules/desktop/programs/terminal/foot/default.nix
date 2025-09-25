{
  lib,
  config,
  ...
}: let
  cfg = config.programs'.foot;
in {
  options.programs'.foot = {
    enable = lib.mkEnableOption {};
    isDefault = lib.mkEnableOption {};
  };
  config = lib.mkMerge [
    (lib.mkIf cfg.isDefault {globals.defaultTerminal = "foot";})
    (lib.mkIf cfg.enable {
      hm'.programs.foot = {
        enable = true;
        # server.enable = true;
        settings = {
          main = {
            pad = "8x8";
          };
          mouse = {
            hide-when-typing = true;
          };
        };
      };
    })
  ];
}
