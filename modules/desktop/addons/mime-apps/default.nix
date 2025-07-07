{
  lib,
  config,
  ...
}: let
  cfg = config.desktop.mime-apps;
in {
  options.desktop.mime-apps.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    hm.xdg.mimeApps = {
      enable = true;

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
