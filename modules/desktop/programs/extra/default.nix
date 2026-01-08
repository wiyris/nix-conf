{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.programs'.extraPackages;
in
{
  options.programs'.extraPackages.enable = lib.mkEnableOption { };
  config = lib.mkIf cfg.enable {
    programs.gpu-screen-recorder.enable = true; # For promptless recording on both CLI and GUI
    hm'.home.packages = with pkgs; [
      gowall
      microfetch
      qemu
      scdl
      tealdeer
      yt-dlp
      wiremix
      # bluetui

      ## gtk
      # d-spy # dbus gui
      # easyeffects
      # easytag
      # gimp3
      # pavucontrol
      librewolf

      ## qt
      # kdePackages.kdenlive
      # krita
      puddletag
      jellyfin-desktop

      ## electron

      ## other
      # blender
      # grayjay
      # vpkedit
      feishin
      faugus-launcher
      melonDS
      mgba
      input-remapper
      waybar
    ];
  };
}
