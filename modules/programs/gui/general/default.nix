{
  pkgs,
  config,
  lib,
  ...
}: let
  cfg = config.deskton.wayland-session;
in {
  options.desktop.wayland-session.enable = lib.mkEnableOption {};
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
