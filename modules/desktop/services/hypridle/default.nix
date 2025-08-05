{
  lib,
  config,
  ...
}: let
  cfg = config.desktop.hypridle;
in {
  options.desktop.hypridle.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    hm = {
      systemd.user.services.hypridle.Install.WantedBy = lib.mkForce [];
      services.hypridle = {
        enable = true;
        settings = {
          general = {
            before_sleep_cmd = "loginctl lock-session";
            after_sleep_cmd = "hyprctl dispatch dpms on";
            ignore_dbus_inhibit = false;
            lock_cmd = "pidof hyprlock || hyprlock";
          };

          listener = [
            {
              timeout = 180;
              on-timeout = "brightnessctl -s set 30";
              on-resume = "brightnessctl -r";
            }
            {
              timeout = 3600;
              on-timeout = "loginctl lock-session";
            }
            # {
            #   timeout = 1800;
            #   on-timeout = "hyprctl dispatch dpms off";
            #   on-resume = "hyprctl dispatch dpms on";
            # }
            # {
            #   timeout = 3600;
            #   on-timeout = "sysemctl suspend";
            # }
          ];
        };
      };
    };
  };
}
