{
  config,
  pkgs,
  lib,
  ...
}: let
  cfg = config.desktop.fonts;
in {
  options.desktop.fonts.enable = lib.mkEnableOption {};

  config = lib.mkIf cfg.enable {
    fonts = {
      packages = with pkgs; [
        noto-fonts
        noto-fonts-cjk-sans
        noto-fonts-cjk-serif
        # noto-fonts-color-emoji
        noto-fonts-monochrome-emoji

        maple-mono.NF
        nerd-fonts.jetbrains-mono
        nerd-fonts.noto
      ];
      fontconfig = {
        enable = true;
        allowBitmaps = true;
      };
    };
  };
}
