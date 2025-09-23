{
  config,
  lib,
  ...
}: let
  cfg = config.programs'.wezterm;
in {
  options.programs'.wezterm.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    hm' = {
      programs.wezterm = {
        enable = true;
      };
    };
  };
}
