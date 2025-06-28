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

      # systemd.user.services.cliphist = lib._custom.mkWaylandService {
      #   Unit.Description = "Wayland clipboard manager";
      #   Unit.Documentation = "https://github.com/sentriz/cliphist";
      #   Service = {
      #     Restart = "on-failure";
      #     KillMode = "mixed";
      #   };
      # };
    };
  };
}
