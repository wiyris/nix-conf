{
  pkgs,
  config,
  lib,
  ...
}: let
  cfg = config.desktop.wayland-session;
in {
  config = lib.mkIf cfg.enable {
    hm'.home.packages = with pkgs; [
      ## cli/tui
      gowall
      taskwarrior-tui
      tldr
      tray-tui

      ## gtk
      thunderbird

      ## qt

      ## electron
      obsidian
    ];
  };
}
