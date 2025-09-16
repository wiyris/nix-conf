{
  lib,
  config,
  ...
}: let
  cfg = config.programs'.tray-tui;
in {
  options.programs'.tray-tui.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    hm'= {
      home.shellAliases.ttui = "tray-tui";
      programs.tray-tui = {
        enable = true;
        settings = {
          columns = 5;
          mouse = true;
          key_map = {
            down = "menu_down";
            up = "menu_up";
          };
        };
      };
    };
  };
}
