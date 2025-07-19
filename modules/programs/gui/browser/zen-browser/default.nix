{
  inputs,
  lib,
  pkgs,
  config,
  ...
}: let
  betterfox = inputs.betterfox;
  cfg = config.custom.programs.zen-browser;
in {
  options.custom.programs.zen-browser = {
    enable = lib.mkEnableOption {};
    isDefault = lib.mkEnableOption {};
  };
  config = lib.mkMerge [
    (lib.mkIf cfg.isDefault {
      globals.defaultBrowser = "zen-beta";
      xdg.mimeApps.defaultApplications = {
        "text/html" = "zen-beta.desktop";
        "x-scheme-handler/http" = "zen-beta.desktop";
        "x-scheme-handler/https" = "zen-beta.desktop";
      };
    })
    (lib.mkIf cfg.enable {
      environment.systemPackages = [inputs.zen-browser.packages."${pkgs.system}".default];
      hm = {
        imports = [inputs.zen-browser.homeModules.beta];
        programs.zen-browser = {
          enable = true;
          # extraConfig = ''
          #   ${builtins.readFile "${betterfox}/zen/user.js"}
          # '';
        };
      };
    })
  ];
}
