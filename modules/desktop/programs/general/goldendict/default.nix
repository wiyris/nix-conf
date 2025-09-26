{
  lib,
  pkgs,
  config,
  ...
}: let
  cfg = config.programs'.goldendict;
in {
  options.programs'.goldendict.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    hm'.home = {
      packages = with pkgs; [goldendict-ng];
      sessionVariables.GOLDENDICT_FORCE_WAYLAND = 1;
    };
  };
}
