{
  config,
  inputs,
  lib,
  pkgs,
  ...
}: let
  inherit (pkgs) writeText;
  cfg = config.services'.stash;
  stash = inputs.stash.packages.${pkgs.system}.default;
  regex = "(password|secret|api[_-]?key|token)[=: ]+[^\s]+";
in {
  options.services'.stash.enable = lib.mkEnableOption [];
  config = lib.mkIf cfg.enable {
    hm' = {
      home.packages = [
        stash
        # pkgs.wl-clipboard-rs
      ];
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
          LoadCredential = "clipboard_filter:${writeText "stash-regex" regex}";
        };
      };
    };
  };
}
