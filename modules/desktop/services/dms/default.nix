{
  config,
  inputs,
  lib,
  ...
}:
let
  cfg = config.programs'.dms;
in
{
  options.programs'.dms.enable = lib.mkEnableOption { };
  config = lib.mkIf cfg.enable {
    hm' = {
      imports = [ inputs.dms.homeModules.dankMaterialShell.default ];

      programs.dankMaterialShell = {
        enable = true;
      };
    };
  };
}
