{
  lib,
  config,
  ...
}: let
  cfg = config.custom.services.sk-serve;
in {
  options.custom.services.sk-serve.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    systemd.user.services.sk-serve = {
      enable = true;
      after = ["network.target" "graphical-session.target"];
      partOf = ["graphical-session.target"];
      requires = ["graphical-session.target"];
      wantedBy = ["graphical-session.target"];
      serviceConfig = {
        Type = "simple";
        ExecStart = ''bash -c 'cd /home/tsubaki/sk/; npm run gulp serve-simple'';
        Restart = "always";
        RestarSec = 10;
      };
    };
  };
}
