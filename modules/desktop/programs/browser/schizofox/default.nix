{
  lib,
  inputs,
  config,
  ...
}: let
  cfg = config.programs'.schizofox;
in {
  options.programs'.schizofox.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    hm'= {
      imports = [inputs.schizofox.homeManagerModules.default];
      programs.schizofox = {
        enable = true;
      };
    };
  };
}
