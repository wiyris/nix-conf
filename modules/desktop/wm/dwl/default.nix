{
  lib,
  pkgs,
  config,
  ...
}:
let
  cfg = config.programs'.dwl;

  dwl-final =
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

  dwlb-final = pkgs.dwlb.override {
    configH = ./dwlb/config.h;
  };

  slstatus-final = pkgs.slstatus.override {
    conf = ./slstatus/config.h;
  };

  startw = pkgs.writeShellScriptBin "startw" ''
    #!/usr/bin/env sh
    dwl -s dwlb & slstatus -s | dwlb -status-stdin all
  '';
in
{
  options.programs'.dwl = {
    enable = lib.mkEnableOption { };
    isDefault = lib.mkEnableOption { };
  };

  config = lib.mkIf cfg.enable {
    programs.dwl = {
      enable = true;
      package = dwl-final;
    };

    environment.systemPackages = [
      dwlb-final
      slstatus-final
      startw
    ];

    xdg.portal.config.dwl.default = [
      "wlr"
      "gtk"
    ];
  };
}
