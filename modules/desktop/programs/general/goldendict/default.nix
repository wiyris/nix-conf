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
    environment.systemPackages = with pkgs; [goldendict-ng];
    hm'.home.sessionVariables = {
      GOLDENDICT_FORCE_WAYLAND = 1;
    };
  };
}
