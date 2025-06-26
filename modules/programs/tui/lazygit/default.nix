{
  lib,
  config,
  ...
}: let
  cfg = config.custom.programs.lazygit;
in {
  options.custom.programs.lagygit.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    hm.programs.lazygit = {
      enable = true;
    };
  };
}
