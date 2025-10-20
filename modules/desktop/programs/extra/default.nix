{
  pkgs,
  config,
  lib,
  ...
}: let
  cfg = config.programs'.extraPackages;
in {
  options.programs'.extraPackages.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    hm'.home.packages = with pkgs; [
      ## cli/tui
      # cowsay
      # fortune
      gowall
      # lolcat
      microfetch
      # qemu
      # scdl
      # taskwarrior-tui
      tldr
      # yt-dlp

      ## gtk
      # blanket # play rain, waves, etc sounds
      # d-spy # dbus gui
      # dissent
      # easyeffects
      # easytag
      gimp3
      gpu-screen-recorder-gtk
      grayjay
      # pwvucontrol # pipewire gui
      # remmina # vnc client

      ## qt
      # calibre
      # kdePackages.filelight
      # kdePackages.kalgebra
      # kdePackages.kdenlive
      # krita
      # openshot-qt
      # puddletag
      # qbittorrent

      ## electron
      legcord
      vesktop

      ## SDK
      # vpkedit
      vlc

      ## other
      # aseprite
      # blender
    ];
  };
}
