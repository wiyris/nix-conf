let
  workspaces = {
    "1" = {
      name = "daemon";
    };
    "2" = {
      name = "browser";
    };
    "3" = {
      name = "editor";
    };
    "4" = {
      name = "media";
    };
  };
  windowRules = [
    {
      geometry-corner-radius = let
        radius = 7.0;
      in {
        bottom-left = radius;
        bottom-right = radius;
        top-left = radius;
        top-right = radius;
      };
      clip-to-geometry = true;
      draw-border-with-background = false;
      open-maximized = true;
    }
    {
      matches = [
        {is-active = true;}
      ];
      shadow = {
        enable = true;
        softness = 20;
        spread = 5;
        color = "#f5e0dc69";
      };
    }
    {
      matches = [
        {is-floating = true;}
      ];
      shadow = {
        enable = true;
        softness = 15;
        spread = 3;
        color = "#f5e0dc69";
        inactive-color = "#00000054";
      };
    }
    {
      matches = [
        {
          is-window-cast-target = true;
        }
      ];
      focus-ring = {
        width = 2;
        active.color = "#f5e0dc";
        inactive.color = "#7d0d2d";
      };
      border = {
        inactive.color = "#7d0d2d";
      };
      shadow = {
        color = "#7d0d2d70";
      };
      tab-indicator = {
        active.color = "#f38ba8";
        inactive.color = "#7d0d2d";
      };
    }
    {
      matches = [
        {app-id = "Proton Pass";}
      ];
      block-out-from = "screen-capture";
    }
    # {
    #   matches = [
    #     {app-id = "scratchpad";}
    #   ];
    #   block-out-from = "screen-capture";
    # }
    {
      matches = [
        {app-id = "^steam$";}
        {app-id = "^vesktop$";}
        {app-id = "^GoldenDict-ng$";}
        {app-id = "^spotify$";}
        {app-id = "^thuderbird$";}
      ];
      open-on-workspace = "daemon";
    }
    {
      matches = [
        {app-id = "^zen-beta$";}
        {app-id = "^firefox$";}
        {app-id = "^librewolf$";}
        {app-id = "^chromium$";}
      ];
      open-on-workspace = "browser";
    }
    {
      matches = [
        {app-id = "^kitty$";}
        {app-id = "^com.mitchellh.ghostty$";}
        {app-id = "^thunar$";}
      ];
      open-maximized = false;
    }
  ];
in {
  programs.niri.settings = {
    inherit workspaces;
    window-rules = windowRules;
    layer-rules = [
      {
        matches = [{namespace = "^swww-daemon$";}];
        place-within-backdrop = true;
      }
    ];
  };
}
