{
  pkgs,
  config,
  lib,
  ...
}: let
  cfg = config.desktop.wayland-session;
in {
  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs;
      [
        #gtk
        thunderbird

        #qt
        anki

        # electron
        vesktop
        obsidian
      ]
      ++ lib.optionals config.extraPackages.enable [
        # gtk
        gimp3
        grayjay
        gpu-screen-recorder-gtk

        # qt
        qbittorrent
        # openshot-qt

        # electron
        freetube
      ];
  };
}
