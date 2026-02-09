{
  pkgs,
  config,
  lib,
  ...
}:
let
  cfg = config.services'.dunst;
  inherit (lib) mkForce;

  inherit (config.lib.stylix.colors.withHashtag)
    base00
    base02
    base03
    base05
    base07
    base08
    base0E
    ;
in
{
  options.services'.dunst.enable = lib.mkEnableOption { };
  config = lib.mkIf cfg.enable {
    hm'.services.dunst = {
      enable = true;

      # iconTheme = {
      #   package = pkgs.papirus-icon-theme;
      #   name = "Papirus";
      # };

      settings = {
        global = {
          follow = "keyboard";
          width = 370;
          separator_height = 1;
          padding = 24;
          horizontal_padding = 24;
          frame_width = 0;
          corner_radius = 7;
          sort = "update";
          idle_threshold = 120;
          alignment = "center";
          word_wrap = "yes";
          transparency = 0;
          format = "<b>%s</b>: %b";
          markup = "full";
          min_icon_size = 32;
          max_icon_size = 128;
          highlight = mkForce base03;
          timeout = 7;
        };

        urgency_low = {
          foreground = mkForce base05;
          # frame_color = mkForce base02;
          frame_color = mkForce base07;
          background = mkForce "#11111b";
        };

        urgency_normal = {
          # frame_color = mkForce base07;
          background = mkForce "#11111b";
        };

        urgency_critical = {
          foreground = mkForce base08;
          frame_color = mkForce base0E;
        };
      };
    };
  };
}
