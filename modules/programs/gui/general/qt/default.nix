{
  pkgs,
  config,
  lib,
  ...
}: let
  cfg = config.custom.programs.qt;
in {
  options.custom.programs.qt.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs;
      [
        anki
      ]
      ++ lib.optionals config.bloat.enable [
        qbittorrent
        # openshot-qt
      ];
  };
}
