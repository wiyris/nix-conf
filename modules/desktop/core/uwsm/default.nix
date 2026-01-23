{
  config,
  lib,
  ...
}:
let
  cfg = config.desktop.uwsm;
  inherit (config.globals) defaultWM;
in
{
  options.desktop.uwsm.enable = lib.mkEnableOption { };
  config = lib.mkIf cfg.enable {
    programs.uwsm.enable = true;
    hm' = {
      programs.fish.loginShellInit = # fish
        ''
          if uwsm check may-start
            exec uwsm start ${defaultWM}-uwsm.desktop
          end
        '';

      home.shellAliases = {
        hyp = "uwsm start hyprland-uwsm.desktop";
        ugo = "uwsm start mango-uwsm.desktop";
        uri = "uwsm start niri-uwsm.desktop";
        uwy = "uwsm start sway-uwsm.desktop";
        uws = "uwsm stop";
      };
    };
  };
}
