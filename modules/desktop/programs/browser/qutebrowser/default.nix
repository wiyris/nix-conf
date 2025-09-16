{
  lib,
  config,
  ...
}: let
  cfg = config.programs'.qutebrowser;
in {
  options.programs'.qutebrowser.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    hm'.programs.qutebrowser = {
      enable = true;
    };
  };
}
