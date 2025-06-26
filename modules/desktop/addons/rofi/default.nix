{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.desktop.rofi;
  # powermenu =
  #   pkgs.writeScriptBin "tofi-powermenu"
  #   (builtins.readFile ./scripts/tofi-powermenu.sh);
  # screenshot =
  #   pkgs.writeScriptBin "tofi-emoji"
  #   (builtins.readFile ./scripts/tofi-emoji.sh);
  wallpaper =
    pkgs.writeScriptBin "wallpaper"
    (builtins.readFile ./scripts/wallpaper.sh);
in {
  options.desktop.rofi.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    hm = {
      home.packages = [
        pkgs.rofi-wayland

        wallpaper
      ];
      xdg.configFile = {
        "rofi/config.rasi".source = ./dots/config.rasi;
        "rofi/style.rasi".source = ./dots/style.rasi;
        "rofi/theme/catppuccin-mocha.rasi".source = ./dots/theme/catppuccin-mocha.rasi;
        "rofi/theme/wallpaper.rasi".source = ./dots/wallpaper.rasi;
      };
    };
  };
}
