{
  pkgs,
  config,
  lib,
  ...
}: let
  cfg = config.desktop.dunst;
  inherit (lib) mkForce;

  inherit
    (config.lib.stylix.colors.withHashtag)
    base00
    base02
    base03
    base08
    base0A
    base0E
    ;
in {
  options.desktop.dunst.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    hm.services.dunst = {
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
          frame_width = 2;
          corner_radius = 10;
          sort = "update";
          idle_threshold = 120;
          alignment = "center";
          word_wrap = "yes";
          transparency = 5;
          format = "<b>%s</b>: %b";
          markup = "full";
          min_icon_size = 32;
          max_icon_size = 128;
          highlight = mkForce base03;
        };

        urgency_low = {
          foreground = mkForce base0A;
          frame_color = mkForce base02;
        };

        urgency_normal = {
          frame_color = mkForce base0E;
          background = mkForce "#1e1e2e05";
        };

        urgency_critical = {
          foreground = mkForce base08;
          frame_color = mkForce base0E;
        };
      };
    };
  };
}
