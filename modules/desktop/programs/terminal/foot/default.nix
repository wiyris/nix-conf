{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.programs'.foot;
in {
  options.programs'.foot = {
    enable = lib.mkEnableOption {};
    isDefault = lib.mkEnableOption {};
  };
  config = lib.mkMerge [
    (lib.mkIf cfg.isDefault {globals.defaultTerminal = "foot";})
    (lib.mkIf cfg.enable {
      hm'.programs.foot = {
        enable = true;
        server.enable = true;
        settings = {
          main = {
            horizontal-letter-offset = 0;
            vertical-letter-offset = 0;
            pad = "4x4 center";
            selection-target = "clipboard";
          };
          bell = {
            urgent = "yes";
            notify = "yes";
          };

          desktop-notifications = {
            command = "${lib.getExe pkgs.libnotify} -a \${app-id} -i \${app-id} \${title} \${body}";
          };

          scrollback = {
            lines = 10000;
            multiplier = 3;
            indicator-position = "relative";
            indicator-format = "line";
          };

          url = {
            launch = "${pkgs.xdg-utils}/bin/xdg-open \${url}";
          };

          cursor = {
            style = "beam";
            beam-thickness = 1;
          };
          mouse = {
            hide-when-typing = true;
          };
        };
      };
    })
  ];
}
