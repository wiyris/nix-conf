{
  lib,
  config,
  ...
}:
let
  cfg = config.gaming'.mangohud;
in
{
  options.gaming'.mangohud.enable = lib.mkEnableOption { };
  config = lib.mkIf cfg.enable {
    hm' = {
      stylix.targets.mangohud.enable = true;
      programs.mangohud = {
        enable = true;

        # https://github.com/flightlessmango/MangoHud/blob/master/data/MangoHud.conf
        settings = {
          background_alpha = lib.mkForce 0.0;
        };
      };
    };
  };
}
