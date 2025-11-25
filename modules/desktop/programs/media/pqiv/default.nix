{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.programs'.pqiv;
in
{
  options.programs'.pqiv.enable = lib.mkEnableOption { };
  config = lib.mkIf cfg.enable {
    environment.systemPackages = [ pkgs.pqiv ];
    hm' = {
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
      xdg.mimeApps.defaultApplications =
        let
          pqiv = "pqiv.desktop";
        in
        {
          "image/bmp" = [ pqiv ];
          "image/gif" = [ pqiv ];
          "image/jpeg" = [ pqiv ];
          "image/jpg" = [ pqiv ];
          "image/pjpeg" = [ pqiv ];
          "image/png" = [ pqiv ];
          "image/tiff" = [ pqiv ];
          "image/webp" = [ pqiv ];
          "image/x-bmp" = [ pqiv ];
          "image/x-gray" = [ pqiv ];
          "image/x-icb" = [ pqiv ];
          "image/x-ico" = [ pqiv ];
          "image/x-png" = [ pqiv ];
          "image/x-portable-anymap" = [ pqiv ];
          "image/x-portable-bitmap" = [ pqiv ];
          "image/x-portable-graymap" = [ pqiv ];
          "image/x-portable-pixmap" = [ pqiv ];
          "image/x-xbitmap" = [ pqiv ];
          "image/x-xpixmap" = [ pqiv ];
          "image/x-pcx" = [ pqiv ];
          "image/svg+xml" = [ pqiv ];
          "image/svg+xml-compressed" = [ pqiv ];
          "image/vnd.wap.wbmp" = [ pqiv ];
          "image/x-icns" = [ pqiv ];
        };
    };
  };
}
