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
      imports = [
        ./modules/idle_inhibitor.nix
        ./modules/hyprland.nix
        ./modules/pulseaudio.nix
        # ./style.nix
      ];

      stylix.targets.waybar.addCss = false;
      programs.waybar = {
        enable = true;

        settings.main = {
          layer = "top";
          height = 35;
          margin-top = 10;
          margin-left = 18;
          margin-bottom = 0;
          margin-right = 18;
          reload_style_on_change = true;

          modules-left = [
            "idle_inhibitor"
            "hyprland/workspaces"
          ];

          # modules-center = [
          #   # "mpris"
          # ];
          #
          modules-right = [
            "pulseaudio"
          ];
        };
      };
      # style = lib.mkAfter (builtins.readFile ./style.css);
    };
  };
}
