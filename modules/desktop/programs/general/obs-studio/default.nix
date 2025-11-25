{
  lib,
  pkgs,
  inputs,
  config,
  ...
}:
let
  cfg = config.programs'.obs-studio;
in
{
  options.programs'.obs-studio.enable = lib.mkEnableOption { };
  config = lib.mkIf cfg.enable {
    hm' = {
      xdg.configFile."obs-studio/themes".source = "${inputs.catppuccin-obs}/themes";
      programs.obs-studio = {
        enable = true;
        plugins = with pkgs; [
          obs-studio-plugins.wlrobs

          obs-studio-plugins.obs-vkcapture
          obs-studio-plugins.obs-vaapi
        ];
      };
    };
  };
}
