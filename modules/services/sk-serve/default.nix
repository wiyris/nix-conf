{
  lib,
  pkgs,
  config,
  ...
}: let
  cfg = config.custom.services.sk-serve;
  sk-serve-script = pkgs.writeShellScriptBin "sk-serve" ''
    #!/usr/bin/env bash
    cd /home/tsubaki/sk/
    nix develop --command npm run gulp serve
  '';
in {
  options.custom.services.sk-serve.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    systemd.user.services.sk-serve = {
      enable = true;
      after = ["network.target" "graphical-session.target"];
      partOf = ["graphical-session.target"];
      wantedBy = ["graphical-session.target"];
      serviceConfig = {
        Type = "simple";
        ExecStart = ''${sk-serve-script}/bin/sk-serve'';
        Restart = "always";
      };
    };
  };
}
