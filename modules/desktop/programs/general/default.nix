{
  pkgs,
  config,
  lib,
  ...
}: let
  cfg = config.desktop.wayland-session;
in {
  config = lib.mkIf cfg.enable {
    hm'.home.packages = with pkgs;
      [
        gowall
        taskwarrior-tui
        tray-tui

        # gtk
        thunderbird

        # qt

        # electron
        obsidian
      ]
      ++ lib.optionals config.extraPackages.enable [
        fortune
        lolcat
        cowsay
        calibre
        # aseprite
        # blender

        # gtk
        gimp3
        grayjay
        gpu-screen-recorder-gtk
        # dissent
        # blanket # play rain, waves, etc sounds
        # d-spy # dbus gui
        # pwvucontrol # pipewire gui
        # remmina # vnc client
        easytag
        easyeffects

        # qt
        # kdePackages.filelight
        # kdePackages.kalgebra
        # kdePackages.kdenlive
        qbittorrent
        # openshot-qt
        # krita
        puddletag

        # electron
        freetube
        # legcord
        vesktop
      ];
    # programs.kdeconnect.enable = true;
  };
}
