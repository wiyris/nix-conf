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
    hm = {
      services.cliphist.enable = true;
      home.packages = with pkgs; [
        wl-clip-persist
        wl-clipboard-rs
      ];
    };
  };
}
