{
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.gaming.gamemode;
in {
  options.gaming.gamemode.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    custom.user.extraGroups = ["gamemode"];
    gamemode = {
      enable = true;
      settings = {
        general = {
          renice = 19;
        };
        gpu = {
          apply_gpu_optimisations = "accept-responsibility";
          gpu_device = 0;
          amd_performance_level = "high";
        };
        custom = {
          start = "${pkgs.libnotify}/bin/notify-send 'GameMode started'";
          end = "${pkgs.libnotify}/bin/notify-send 'GameMode ended'";
        };
      };
    };
  };
}
