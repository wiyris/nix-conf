{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.programs'.sway;
in
{
  options.programs'.sway = {
    enable = lib.mkEnableOption { };
    isDefault = lib.mkEnableOption { };
  };

  config = lib.mkIf cfg.enable {
    programs.uwsm.waylandCompositors.sway = {
      prettyName = "Sway";
      comment = "";
      # binPath = "/run/current-system/sw/bin/sway";
      binPath = "${pkgs.sway}/bin/sway";
    };

    programs.sway = {
      enable = true;
      xwayland.enable = false;
      extraPackages = [ ];
    };

    hm' = {
      #   wayland.windowManager.sway = {
      #     enable = true;
      #   };
    };
  };
}
