{
  lib,
  config,
  ...
}: let
  cfg = config.custom.programs.foot;
in {
  options.custom.programs.foot = {
    enable = lib.mkEnableOption {};
    isDefault = lib.mkEnableOption {};
  };
  config = lib.mkMerge [
    (lib.mkIf cfg.isDefault {globals.defaultTerminal = "foot";})
    (lib.mkIf cfg.enable {
      hm'.programs.foot = {
        enable = true;
        server.enable = true;
        settings = {
          main = {
            pad = "8x8";
          };
        };
      };
    })
  ];
}
