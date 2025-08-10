{
  pkgs,
  config,
  lib,
  ...
}: let
  cfg = config.desktop.wayland-session;
in {
  config = lib.mkIf cfg.enable {
    hm.home.packages = with pkgs;
      [
        # cli
        gowall
        taskwarrior3

        # tui
        taskwarrior-tui
        tray-tui

        # gtk
        thunderbird

        # qt
        # anki

        # electron
        obsidian
      ]
      ++ lib.optionals config.extraPackages.enable [
        # gtk
        gimp3
        grayjay
        gpu-screen-recorder-gtk
        dissent

        # qt
        qbittorrent
        # openshot-qt

        # electron
        freetube
        legcord
        vesktop
      ];
  };
}
