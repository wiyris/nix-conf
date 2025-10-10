{
  pkgs,
  config,
  lib,
  ...
}: let
  cfg = config.desktop.wayland;
in {
  config = lib.mkIf cfg.enable {
    hm'.home.packages = with pkgs; [
      ## cli/tui

      ## gtk
      thunderbird

      ## qt

      ## electron
      obsidian
    ];
  };
}
