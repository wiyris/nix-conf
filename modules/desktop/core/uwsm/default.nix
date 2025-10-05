{
  lib,
  pkgs,
  config,
  ...
}: let
  cfg = config.desktop.uwsm;
in {
  options.desktop.uwsm = {
    enable = lib.mkEnableOption {};
  };

  config = lib.mkIf cfg.enable {
    programs.uwsm = {
      enable = true;
      waylandCompositors = {};
    };

    hm' = {
      home.sessionVariables.UWSM_USE_SESSION_SLICE = "true";
      home.sessionVariables.UWSM_APP_UNIT_TYPE = "service";
      programs.fish = {
        # loginShellInit =
        #   # fish
        #   ''
        #     if uwsm check may-start; and uwsm select
        #      exec systemd-cat -t uwsm_start uwsm start default
        #     end
        #   '';
      };
      home.shellAliases = {
        uwl = "uwsm start -- dwl-uwsm.desktop -s 'dwlb'";
        hyp = "uwsm start hyprland-uwsm.desktop";
        uri = "uwsm start niri-uwsm.desktop";
        uws = "uwsm stop";
      };
    };
  };
}
