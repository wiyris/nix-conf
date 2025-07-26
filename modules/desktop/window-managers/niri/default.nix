{
  inputs,
  config,
  ...
}: let
  inherit (config.lib.stylix.colors.withHashtag) base00 base0C;
  inherit (config.globals) homeDirectory;
in {
  programs.uwsm.waylandCompositors.niri = {
    prettyName = "Niri";
    comment = "Niri managed by UWSM";
    binPath = "${homeDirectory}.nix-profile/bin/niri-session";
  };
  hm = {
    imports = [
      inputs.niri.homeModules.niri
      ./dots/binds.nix
      ./dots/rules.nix
    ];
    programs.niri = {
      enable = true;
      settings = {
        screenshot-path = "~/Pictures/Screenshots/Screenshot-from-%Y-%m-%d-%H-%M-%S.png";
        prefer-no-csd = true;
        hotkey-overlay.skip-at-startup = true;

        environment = {
          DISPLAY = ":0";
          NIXOS_OZONE_WL = "1";
          ELECTRON_OZONE_PLATFORM_HINT = "wayland";
        };

        spawn-at-startup = [
          {command = ["uwsm-app waybar"];}
        ];

        input = {
          mouse = {
            accel-speed = 0.0;
            accel-profile = "flat";
          };
          focus-follows-mouse.enable = true;
          warp-mouse-to-focus = true;
          workspace-auto-back-and-forth = true;
        };

        cursor = {
          size = 32;
          theme = "BreezeX-RosePine-Linux";
        };

        layout = {
          border.enable = false;
          focus-ring = {
            enable = true;
            width = 2;
            # active.color = "${base0C}";
            active.gradient = {
              from = "#f5e0dc69";
              to = "#eba0ac69";
              angle = 45;
            };
            inactive.color = "${base00}";
          };

          shadow = {
            enable = false;
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
            left = 0;
            right = 0;
            top = 0;
            bottom = 0;
          };
        };

        animations.shaders.window-resize = ''
          vec4 resize_color(vec3 coords_curr_geo, vec3 size_curr_geo) {
            vec3 coords_next_geo = niri_curr_geo_to_next_geo * coords_curr_geo;

            vec3 coords_stretch = niri_geo_to_tex_next * coords_curr_geo;
            vec3 coords_crop = niri_geo_to_tex_next * coords_next_geo;

            // We can crop if the current window size is smaller than the next window
            // size. One way to tell is by comparing to 1.0 the X and Y scaling
            // coefficients in the current-to-next transformation matrix.
            bool can_crop_by_x = niri_curr_geo_to_next_geo[0][0] <= 1.0;
            bool can_crop_by_y = niri_curr_geo_to_next_geo[1][1] <= 1.0;

            vec3 coords = coords_stretch;
            if (can_crop_by_x)
                coords.x = coords_crop.x;
            if (can_crop_by_y)
                coords.y = coords_crop.y;

            vec4 color = texture2D(niri_tex_next, coords.st);

            // However, when we crop, we also want to crop out anything outside the
            // current geometry. This is because the area of the shader is unspecified
            // and usually bigger than the current geometry, so if we don't fill pixels
            // outside with transparency, the texture will leak out.
            //
            // When stretching, this is not an issue because the area outside will
            // correspond to client-side decoration shadows, which are already supposed
            // to be outside.
            if (can_crop_by_x && (coords_curr_geo.x < 0.0 || 1.0 < coords_curr_geo.x))
                color = vec4(0.0);
            if (can_crop_by_y && (coords_curr_geo.y < 0.0 || 1.0 < coords_curr_geo.y))
                color = vec4(0.0);

            return color;
          }
        '';
      };
    };
  };
}
