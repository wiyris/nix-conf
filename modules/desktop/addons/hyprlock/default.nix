{
  config,
  lib,
  ...
}: let
  cfg = config.desktop.hyprlock;
in {
  options.desktop.hyprlock.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    hm = {
      stylix.targets.hyprlock.enable = false;
      programs.hyprlock = {
        enable = true;
        settings = {
          general = {
            disable_loading_bar = false;
            grace = 5;
            hide_cursor = true;
            no_fade_in = false;
          };

          background = [
            {
              path = "../../../core/stylix/img.png";
              blur_passes = 2;
              blur_size = 3;
              noise = "0.05";
              contrast = "1.3";
            }
          ];

          label = [
            {
              # Day-Month-Date
              monitor = "";
              text = ''cmd[update:1000] echo -e "$(date +"%A, %B %d")"'';
              # color = foreground;
              color = "rgb(137, 180, 250)";
              font_size = 28;
              font_family = "JetBrainsMono Nerd Font SemiBold";
              position = "0, 490";
              halign = "center";
              valign = "center";
            }
            # Time
            {
              monitor = "";
              text = ''cmd[update:1000] echo "<span>$(date +"%I:%M")</span>"'';
              color = "rgb(180, 190, 254)";
              font_size = 160;
              font_family = "JetBrainsMono Nerd Font ExtraBold";
              position = "0, 370";
              halign = "center";
              valign = "center";
            }
            # USER
            {
              monitor = "";
              text = "    $USER";
              color = "rgb(245, 194, 231)";
              outline_thickness = 2;
              dots_size = 0.2; # Scale of input-field height, 0.2 - 0.8
              dots_spacing = 0.2; # Scale of dots' absolute size, 0.0 - 1.0
              dots_center = true;
              font_size = 18;
              font_family = "JetBrainsMono Nerd Font";
              position = "0, -180";
              halign = "center";
              valign = "center";
            }
          ];

          # INPUT FIELD
          input-field = lib.mkForce {
            monitor = "";
            size = "300, 60";
            outline_thickness = 2;
            dots_size = 0.2; # Scale of input-field height, 0.2 - 0.8
            dots_spacing = 0.2; # Scale of dots' absolute size, 0.0 - 1.0
            dots_center = true;
            outer_color = "rgba(25, 25, 25, 0)";
            inner_color = "rgba(25, 25, 25, 0.1)";
            font_color = "rgb(221, 120, 120)";
            fade_on_empty = false;
            font_family = "JetBrainsMono Nerd Font Light";
            placeholder_text = "<i>🔒 Enter Password</i>";
            hide_input = false;
            position = "0, -250";
            halign = "center";
            valign = "center";
          };
        };
      };
    };
  };
}
