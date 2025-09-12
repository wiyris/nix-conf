{
  config,
  pkgs,
  lib,
  ...
}: let
  cfg = config.desktop.clipboard;
in {
  options.desktop.clipboard.enable = lib.mkEnableOption {};

  config = lib.mkIf cfg.enable {
    hm' = {
      services.cliphist.enable = true;
      home.packages = with pkgs; [
        wl-clip-persist
        wl-clipboard-rs
      ];
      home.shellAliases = {
        cwipe = "cliphist wipe";
      };
      wayland.windowManager.hyprland.settings.exec-once = lib.mkIf config.desktop.hyprland.enable [
        "exec-once = wl-paste --watch cliphist store"
        "exec-once = wl-paste --primary --watch wl-copy --primary --clear"
      ];
    };
  };
}
