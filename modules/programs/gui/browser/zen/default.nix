{
  inputs,
  lib,
  pkgs,
  config,
  ...
}: let
  betterfox = inputs.betterfox;
  cfg = config.custom.programs.zen;
in {
  options.custom.programs.zen.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    environment.systemPackages = [inputs.zen-browser.packages."${pkgs.system}".default];
    hm = {
      imports = [inputs.zen-browser.homeModules.beta];
      programs.zen-browser = {
        enable = true;
        # extraConfig = ''
        #   ${builtins.readFile "${betterfox}/zen/user.js"}
        # '';
      };

      xdg.mimeApps.defaultApplications = {
        "text/html" = "zen-beta.desktop";
        "x-scheme-handler/http" = "zen-beta.desktop";
        "x-scheme-handler/https" = "zen-beta.desktop";
      };
    };
  };
}
