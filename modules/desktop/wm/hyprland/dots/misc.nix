{
  wayland.windowManager.hyprland.settings = {
    misc = {
      disable_hyprland_logo = true;
    };

    ecosystem = {
      no_update_news = true;
      no_donation_nag = true;
    };

    xwayland.force_zero_scaling = true;
    dwindle.force_split = 2;

    debug = {
      disable_logs = false;
      full_cm_proto = true; # fix gamescope crash https://github.com/ValveSoftware/gamescope/issues/1825#issuecomment-2831929362
    };
  };
}
