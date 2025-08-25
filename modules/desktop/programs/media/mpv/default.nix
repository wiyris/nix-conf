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
        # pause = true;
        video-sync = "display-resample";

        # enable hardware acceleration
        hwdec = "auto-safe";
        vo = "gpu";
        gpu-hwdec-interop = "vaapi";
        tone-mapping = "auto";
        gpu-api = "vulkan";
      };
      bindings = {
        z = "add sub-delay -0.1";
        Z = "add sub-delay +0.1";

        x = "add secondary-sub-delay -0.1";
        X = "add secondary-sub-delay +0.1";
      };
      scripts = with pkgs.mpvScripts;
        [
          mpris
          thumbfast
          uosc
          # cutter
          quality-menu
          mpv-cheatsheet
        ]
        ++ (with pkgs.mpvScripts.builtins; [
          autoload
        ]);
    };
  };
}
