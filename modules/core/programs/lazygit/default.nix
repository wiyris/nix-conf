{
  lib,
  config,
  ...
}: let
  cfg = config.programs'.lazygit;
in {
  options.programs'.lazygit.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    hm'.programs.lazygit = {
      enable = true;
      settings = {
        promptToReturnFromSubprocess = false;
      };
    };
  };
}
