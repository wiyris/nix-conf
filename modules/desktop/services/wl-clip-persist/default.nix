{
  lib,
  config,
  pkgs,
  ...
}: let
  inherit (lib) mkEnableOption mkIf getExe;
  cfg = config.services'.wl-clip-persist;
in {
  options.services'.wl-clip-persist.enable = mkEnableOption {};
  config = mkIf cfg.enable {
    systemd.user.services.wl-clip-persist = {
      enable = true;
      after = ["graphical-session.target"];
      wantedBy = ["graphical-session.target"];
      partOf = ["graphical-session.target"];
      unitConfig = {
        ConditionEnvironment = "WAYLAND_DISPLAY"; # Only start if WAYLAND_DISPLAY env var is set
      };
      serviceConfig = {
        ExecStart = "${getExe pkgs.wl-clip-persist} --clipboard regular";
        Restart = "on-abort";
      };
    };
  };
}
