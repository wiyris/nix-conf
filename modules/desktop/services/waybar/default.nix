{
  lib,
  config,
  ...
}:
let
  cfg = config.services'.waybar;
in
{
  options.services'.waybar.enable = lib.mkEnableOption { };
  config = lib.mkIf cfg.enable {
    hm' = {
      imports = lib.filesystem.listFilesRecursive ./modules ++ [ ./style.nix ];
      programs.waybar = {
        enable = true;
        settings.main = {
          layer = "top";
          height = 30;
          margin-top = 0;
          margin-left = 0;
          margin-bottom = 0;
          margin-right = 0;
          reload_style_on_change = true;

          modules-left = [
            "idle_inhibitor"
            "sway/workspaces"
          ];

          modules-center = [
            "mpris"
          ];

          modules-right = [
            "clock"
            "pulseaudio"
            "tray"
          ];
        };
      };
      # style = lib.mkAfter (builtins.readFile ./style.css);
    };
  };
}
