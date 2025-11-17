{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.programs'.extraPackages;
in {
  options.programs'.extraPackages.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    programs.gpu-screen-recorder.enable = true; # For promptless recording on both CLI and GUI
    hm'.home.packages = with pkgs; [
      # cowsay
      # fortune
      # gowall
      # lolcat
      microfetch
      # scdl
      # taskwarrior-tui
      tldr
      # yt-dlp

      qemu

      ## gtk
      # blanket # play rain, waves, etc sounds
      # d-spy # dbus gui
      # dissent
      # easyeffects
      # easytag
      # gimp3
      # gpu-screen-recorder-gtk

      ## qt
      # calibre
      # kdePackages.kdenlive
      # krita
      # openshot-qt
      # puddletag
      # qbittorrent
      # vlc

      ## electron
      legcord
      # vesktop
      # dissent

      ## other
      # aseprite
      # blender
      # grayjay
    ];
  };
}
