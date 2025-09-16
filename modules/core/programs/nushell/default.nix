{
  lib,
  config,
  ...
}: let
  cfg = config.programs'.nushell;
in {
  options.programs'.nushell = {
    enable = lib.mkEnableOption {};
    isDefault = lib.mkEnableOption {};
  };

  config = lib.mkMerge [
    (lib.mkIf cfg.isDefault {globals.defaultShell = "nushell";})
    (lib.mkIf cfg.enable {
      hm'= {
        programs.nushell = {
          enable = true;
        };
      };
    })
  ];
}
