{
  lib,
  pkgs,
  config,
  ...
}:
let
  cfg = config.programs'.dwl;
in
{
  options.programs'.dwl = {
    enable = lib.mkEnableOption { };
    isDefault = lib.mkEnableOption { };
  };
  config = lib.mkIf cfg.enable {
    programs.dwl = {
      enable = true;
      package =
        (pkgs.dwl.override {
          configH = ./config.h;
          enableXWayland = false;
        }).overrideAttrs
          (oldAttrs: {
            patches = oldAttrs.patches or [ ] ++ [
              ./patches/attachbottom.patch
              ./patches/tmux-borders-0.7.patch
            ];
          });
    };
    environment.systemPackages = with pkgs; [
      slstatus
      somebar
    ];
    xdg.portal.config.dwl.default = [
      "wlr"
      "gtk"
    ];
  };
}
