{
  config,
  inputs,
  lib,
  pkgs,
  ...
}: let
  cfg = config.services'.stash;
  stash = inputs.stash.packages.${pkgs.system}.default;
in {
  options.services'.stash.enable = lib.mkEnableOption [];
  config = lib.mkIf cfg.enable {
    hm' = {
      home.packages = [stash];
      systemd.user.services.stash = {
        Install = {
          WantedBy = ["graphical-session.target"];
        };
        Unit = {
          Description = "Wayland clipboard manager with fast persistent history and multi-media support";
          After = ["graphical-session.target"];
          PartOf = ["graphical-session.target"];
        };
        Service = {
          Type = "simple";
          ExecStart = "${lib.getExe stash} watch";
          Restart = "on-failure";
          # LoadCredential = "clipboard_filter:/etc/stash/clipboard_filter";
        };
      };
    };
  };
}
