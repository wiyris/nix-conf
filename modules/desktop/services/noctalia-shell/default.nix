{
  config,
  inputs,
  lib,
  ...
}:
let
  cfg = config.programs'.noctalia-shell;
in
{
  options.programs'.noctalia-shell.enable = lib.mkEnableOption { };
  config = lib.mkIf cfg.enable {
    hm' = {
      imports = [
        inputs.noctalia.homeModules.default
      ];

      programs.noctalia-shell = {
        enable = true;
        settings = { };
      };
    };
  };
}
