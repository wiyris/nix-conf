{
  lib,
  config,
  ...
}: let
  cfg = config.custom.programs.nushell;
in {
  options.custom.programs.nushell = {
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
