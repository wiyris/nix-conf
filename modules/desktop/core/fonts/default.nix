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
    fonts.packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-extra
      noto-fonts-emoji

      nerd-fonts.noto
      nerd-fonts.jetbrains-mono
    ];
  };
}
