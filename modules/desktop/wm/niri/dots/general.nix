{config, ...}: let
  inherit (config.lib.stylix.colors.withHashtag) base00 base07;
in {
  # https://github.com/sodiboo/niri-flake/blob/main/docs.md
  programs.niri.settings = {
    screenshot-path = "~/Pictures/Screenshots/Screenshot-from-%Y-%m-%d-%H-%M-%S.png";
    prefer-no-csd = true;
    hotkey-overlay.skip-at-startup = true;

    environment = {DISPLAY = ":0";};

    spawn-at-startup = [{command = ["uwsm" "app" "--" "waybar"];}];

    input = {
      mouse = {
        accel-speed = 0.0;
        accel-profile = "flat";
      };
      focus-follows-mouse.enable = true;
      warp-mouse-to-focus.enable = true;
      workspace-auto-back-and-forth = true;
    };

    overview = {
      workspace-shadow.enable = false;
      backdrop-color = "transparent";
    };

    layout = {background-color = "transparent";};

    cursor = {
      size = 28;
      theme = "Catppuccin Mocha Lavender";
    };

    layout = {
      border.enable = false;
      focus-ring = {
        enable = true;
        width = 2;
        # active.color = "${base07}";
        active.gradient = {
          from = "#f5c2e7ee";
          to = "#eba0acaa";
          angle = 45;
        };
        inactive.color = "${base00}";
      };

      shadow = {
        enable = true;
      };

      preset-column-widths = [
        {proportion = 0.25;}
        {proportion = 0.5;}
        {proportion = 0.75;}
        {proportion = 1.0;}
      ];

      default-column-width = {proportion = 0.5;};

      gaps = 10;

      struts = {
        left = 5;
        right = 5;
        top = 5;
        bottom = 5;
      };

      tab-indicator = {
        hide-when-single-tab = true;
        place-within-column = true;
        position = "left";
        corner-radius = 20.0;
        gap = -12.0;
        gaps-between-tabs = 10.0;
        width = 4.0;
        length.total-proportion = 0.1;
      };
    };

    # animations.window-resize.custom-shader = ''
    #   vec4 resize_color(vec3 coords_curr_geo, vec3 size_curr_geo) {
    #     vec3 coords_next_geo = niri_curr_geo_to_next_geo * coords_curr_geo;
    #
    #     vec3 coords_stretch = niri_geo_to_tex_next * coords_curr_geo;
    #     vec3 coords_crop = niri_geo_to_tex_next * coords_next_geo;
    #
    #     // We can crop if the current window size is smaller than the next window
    #     // size. One way to tell is by comparing to 1.0 the X and Y scaling
    #     // coefficients in the current-to-next transformation matrix.
    #     bool can_crop_by_x = niri_curr_geo_to_next_geo[0][0] <= 1.0;
    #     bool can_crop_by_y = niri_curr_geo_to_next_geo[1][1] <= 1.0;
    #
    #     vec3 coords = coords_stretch;
    #     if (can_crop_by_x)
    #         coords.x = coords_crop.x;
    #     if (can_crop_by_y)
    #         coords.y = coords_crop.y;
    #
    #     vec4 color = texture2D(niri_tex_next, coords.st);
    #
    #     // However, when we crop, we also want to crop out anything outside the
    #     // current geometry. This is because the area of the shader is unspecified
    #     // and usually bigger than the current geometry, so if we don't fill pixels
    #     // outside with transparency, the texture will leak out.
    #     //
    #     // When stretching, this is not an issue because the area outside will
    #     // correspond to client-side decoration shadows, which are already supposed
    #     // to be outside.
    #     if (can_crop_by_x && (coords_curr_geo.x < 0.0 || 1.0 < coords_curr_geo.x))
    #         color = vec4(0.0);
    #     if (can_crop_by_y && (coords_curr_geo.y < 0.0 || 1.0 < coords_curr_geo.y))
    #         color = vec4(0.0);
    #
    #     return color;
    #   }
    # '';
  };
}
