{
  lib,
  pkgs,
  config,
  ...
}: let
  cfg = config.custom.programs.mpv;
in {
  options.custom.programs.mpv.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    hm.programs.mpv = {
      enable = true;
      config = {
        osc = false;
        border = false;

        autofit-larger = "75%x75%";
        hwdec-codecs = "all";
        keep-open = true;
        pause = true;
        video-sync = "display-resample";

        # enable hardware acceleration
        hwdec = "auto-safe";
        vo = "gpu";
      };
      scripts = with pkgs; [
        mpvScripts.mpris
        mpvScripts.thumbfast
        mpvScripts.uosc
        mpvScripts.cutter
        mpvScripts.quality-menu
        mpvScripts.mpv-cheatsheet
      ];
    };
  };
}
