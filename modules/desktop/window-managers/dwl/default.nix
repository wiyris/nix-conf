{
  config,
  pkgs,
  lib,
  ...
}: let
  cfg = config.desktop.dwl;
  dwl-final = pkgs.dwl.override {
    wlroots = pkgs.wlroots_0_18;
    configH =
      builtins.readFile (pkgs.replaceVars ./dots/config.def.h {
        });
  };
in {
  options._custom.desktop.dwl = {
    enable = lib.mkEnableOption {};
    isDefault = lib.mkEnableOption {};
  };

  config = lib.mkIf cfg.enable {
    nixpkgs.overlays = [
      (final: prev: {
        dwl = prev.dwl.overrideAttrs (oldAttrs: rec {
          version = "3efac0422cd9083160b7bfc7563f053084e8d38f"; # v0.8-a/patches-28-mar-2025
          src = prev.fetchgit {
            url = "https://codeberg.org/dwl/dwl.git";
            rev = version;
            hash = "sha256-9cqdinHn4Cyl+RjiQ6fpRUnkV6P2d0iNYMLY4ocU6jI=";
          };
        });
      })
    ];

    environment.systemPackages = [dwl-final];
    xdg.portal.config.dwl.default = ["wlr" "gtk"];
  };
}
