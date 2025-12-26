{
  wayland.windowManager.hyprland.settings = {
    misc = {
      # vrr = 0;
      # vfr = true;
      disable_hyprland_logo = true;
    };

    group = {
      groupbar = {
        # stacked = true;
        render_titles = false;
        keep_upper_gap = false;
      };
    };

    monitorv2 = [
      # {
      #   output = "HDMI-A-1";
      #   mode = "1920x1080@144";
      #   position = "0x0";
      #   scale = 1;
      #   transform = 1;
      # }
      {
        output = "DP-2";
        mode = "2560x1440@144";
        position = "0x0";
        scale = 1.25;
      }
    ];

    ecosystem = {
      no_update_news = true;
      no_donation_nag = true;
    };

    xwayland.force_zero_scaling = true;
    dwindle.force_split = 2;

    debug = {
      # disable_logs = false;
      # full_cm_proto = true; # fix gamescope crash https://github.com/ValveSoftware/gamescope/issues/1825#issuecomment-2831929362
    };
  };
}
