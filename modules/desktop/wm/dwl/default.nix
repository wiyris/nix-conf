{
  lib,
  pkgs,
  config,
  ...
}: let
  cfg = config.desktop.dwl;
in {
  options.desktop.dwl = {
    enable = lib.mkEnableOption {};
    isDefault = lib.mkEnableOption {};
  };
  config = lib.mkIf cfg.enable {
    programs.uwsm.waylandCompositors.dwl = {
      prettyName = "DWL";
      comment = "";
      binPath = "/run/current-system/sw/bin/dwl";
    };

    programs.dwl = {
      enable = true;
      package = (pkgs.dwl.override {configH = ./dots/config.def.h;}).overrideAttrs (oldAttrs: {
        buildInputs =
          oldAttrs.buildInputs or []
          ++ [
            # pkgs.libdrm
            # pkgs.fcft
          ];
        patches =
          oldAttrs.patches or []
          ++ [
            ./patches/autostart-0.7.patch
            ./patches/tmux-borders-0.7.patch
          ];
      });
    };
    environment.systemPackages = with pkgs; [
    ];
    xdg.portal.config.dwl.default = ["wlr" "gtk"];
  };
}
