{
  lib,
  inputs,
  config,
  ...
}: let
  cfg = config.custom.programs.schizofox;
in {
  options.custom.programs.schizofox.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    hm = {
      imports = [inputs.schizofox.homeManagerModules.default];
      programs.schizofox = {
        enable = true;
      };
    };
  };
}
