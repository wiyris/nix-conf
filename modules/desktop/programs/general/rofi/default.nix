{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.programs'.rofi;
  powermenu = pkgs.writeScriptBin "powermenu" (builtins.readFile ./scripts/powermenu.sh);
  screenshot = pkgs.writeScriptBin "screenshot" (builtins.readFile ./scripts/screenshot.sh);
  wallpaper = pkgs.writeScriptBin "wallpaper" (builtins.readFile ./scripts/wallpaper.sh);
in
{
  options.programs'.rofi.enable = lib.mkEnableOption { };
  config = lib.mkIf cfg.enable {
    hm' = {
      home.packages = [
        pkgs.rofi
        # pkgs.rofi-calc
        # pkgs.procps # for uptime --pretty

        powermenu
        screenshot
        wallpaper
      ];
      xdg.configFile = {
        "rofi/config.rasi".source = ./dots/config.rasi;
        "rofi/style.rasi".source = ./dots/style.rasi;
        "rofi/theme/catppuccin-mocha.rasi".source = ./dots/theme/catppuccin-mocha.rasi;
        "rofi/theme/powermenu.rasi".source = ./dots/powermenu.rasi;
        "rofi/theme/cliphist.rasi".source = ./dots/cliphist.rasi;
        "rofi/theme/screenshot.rasi".source = ./dots/screenshot.rasi;
        "rofi/theme/wallpaper.rasi".source = ./dots/wallpaper.rasi;
      };
    };
  };
}
