{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.programs'.nushell;
in {
  options.programs'.nushell = {
    enable = lib.mkEnableOption {};
    isDefault = lib.mkEnableOption {};
  };

  config = lib.mkMerge [
    (lib.mkIf cfg.isDefault {
      globals.defaultShell = "nushell";
      user'.shell = pkgs.nu;
      hm'.programs.nushell.environmentVariables.SHELL = "${pkgs.nushell}/bin/nu";
    })
    (lib.mkIf cfg.enable {
      hm' = {
        programs.nushell = {
          enable = true;
        };
      };
    })
  ];
}
