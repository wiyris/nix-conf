{
  lib,
  pkgs,
  inputs,
  config,
  ...
}: let
  cfg = config.desktop.niri;
in {
  options.desktop.niri = {
    enable = lib.mkEnableOption {};
    isDefault = lib.mkEnableOption {};
  };

  config = lib.mkIf cfg.enable {
    programs.uwsm.waylandCompositors.niri = {
      prettyName = "Niri-UWSM";
      comment = "Niri managed by UWSM";
      binPath = "${pkgs.niri}/bin/niri-session";
    };
    hm = {
      imports = [
        inputs.niri.homeModules.niri
        ./dots/binds.nix
        ./dots/general.nix
        ./dots/rules.nix
      ];
      programs.niri.enable = true;
      xdg.portal.config.niri.default = ["gnome" "gtk"];
      home.packages = [pkgs.xwayland-satellite];
    };
  };
}
