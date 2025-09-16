{
  lib,
  inputs,
  config,
  ...
}: let
  betterfox = inputs.betterfox;
  cfg = config.programs'.firefox;
  inherit (config.globals) userName;
in {
  options.programs'.firefox = {
    enable = lib.mkEnableOption {};
    isDefault = lib.mkEnableOption {};
  };

  config = lib.mkMerge [
    (lib.mkIf cfg.isDefault {
      globals.defaultBrowser = "firefox";
      hm'.xdg.mimeApps.defaultApplications = {
        "text/html" = "firefox.desktop";
        "x-scheme-handler/http" = "firefox.desktop";
        "x-scheme-handler/https" = "firefox.desktop";
      };
    })
    (lib.mkIf cfg.enable {
      hm'= {
        stylix.targets.firefox.profileNames = ["${userName}"];
        programs.firefox = {
          enable = true;
          policies = import ../share/policies;
          profiles.${userName} = {
            search = import ../share/search;
            settings = import ./dots/settings.nix;

            extraConfig = ''
              ${builtins.readFile "${betterfox}/user.js"}
            '';
          };
        };
      };
    })
  ];
}
