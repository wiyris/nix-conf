{
  inputs,
  lib,
  pkgs,
  config,
  ...
}: let
  cfg = config.custom.programs.zen;
in {
  options.custom.programs.zen.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    environment.systemPackages = [inputs.zen-browser.packages."${pkgs.system}".default];

    hm.xdg.mimeApps = {
      defaultApplications = {
        "text/html" = "zen-beta.desktop";
        "text/markdown" = "nvim.desktop";
        "text/plain" = "nvim.desktop";
        "x-scheme-handler/http" = "zen-beta.desktop";
        "x-scheme-handler/https" = "zen-beta.desktop";
      };
    };
  };
}
