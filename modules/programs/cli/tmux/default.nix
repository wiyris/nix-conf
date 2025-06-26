{
  config,
  lib,
  ...
}: let
  cfg = config.custom.programs.tmux;
in {
  options.custom.programs.tmux.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    hm.programs.tmux = {
      enable = true;
      mouse = true;

      keyMode = "vi";

      extraConfig =
        # fish
        ''
          set -sg escape-time 0
        '';
    };
  };
}
