{
  lib,
  config,
  ...
}: let
  cfg = config.custom.programs.pqiv;
in {
  options.custom.programs.pqiv.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    hm'= {
      programs.pqiv = {
        enable = true;

        settings = {
          options = {
            lazy-load = true;
            hide-info-box = true;
            scale-mode-screen-fraction = true;
            background-pattern = "black";
            disable-backends = "archive,archive_cbx,libav,poppler,spectre";
            thumbnail-size = "256x256";
            command-1 = "thunar";
            command-2 = "trash put";
          };
        };

        extraConfig = ''
          [actions]
          set_cursor_auto_hide(1)
        '';
      };
      xdg.mimeApps.defaultApplications = {
        "image/png" = "pqiv.desktop";
        "image/jpeg" = "pqiv.desktop";
        "image/gif" = "pqiv.desktop";
        "image/webp" = "pqiv.desktop";
      };
    };
  };
}
