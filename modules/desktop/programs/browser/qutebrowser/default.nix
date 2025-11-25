{
  lib,
  config,
  ...
}:
let
  cfg = config.programs'.qutebrowser;
  inherit (config.lib.stylix.colors.withHashtag)
    base00
    ;
in
{
  options.programs'.qutebrowser.enable = lib.mkEnableOption { };
  config = lib.mkIf cfg.enable {
    hm'.programs.qutebrowser = {
      enable = true;
      settings = {
        colors = {
          hints = { };
          tabs.bar = { };
        };
        hints = {
          radius = 1;
        };
        scrolling = {
          bar = "never";
          smooth = false;
        };
        tabs = {
          show = "multiple";
          position = "left";
          width = "15%";
          background = true;
          last_close = "close";
          mode_on_change = "restore";
          close_mouse_button = "right";
        };
      };
    };
  };
}
