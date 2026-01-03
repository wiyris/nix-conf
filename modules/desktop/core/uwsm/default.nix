{
  config,
  lib,
  ...
}:
let
  cfg = config.desktop.uwsm;
in
{
  options.desktop.uwsm.enable = lib.mkEnableOption { };
  config = lib.mkIf cfg.enable {
    programs.uwsm.enable = true;
    hm'.shellAliases = {
      hyp = "uwsm start hyprland-uwsm.desktop";
      uri = "uwsm start niri-uwsm.desktop";
      uwy = "uwsm start sway-uwsm.desktop";
      uwl = "uwsm start -- dwl-uwsm.desktop -s 'dwlb -scale 2'";
      uws = "uwsm stop";
    };
  };
}
