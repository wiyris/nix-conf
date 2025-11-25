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
    hm'.home.packages = [stash];
    systemd.user.services.stash = {
      enable = true;
      after = ["graphical-session.target"];
      wantedBy = ["graphical-session.target"];
      partOf = ["graphical-session.target"];
      serviceConfig = {
        ExecStart = "${lib.getExe stash} --max-items 20 watch";
        Restart = "on-abort";
        loadCredential = "clipboard_filter:${writeText "stash-regex" regex}";
      };
    };
  };
}
