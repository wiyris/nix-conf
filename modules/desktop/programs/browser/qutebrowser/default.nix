{
  lib,
  config,
  ...
}: let
  cfg = config.custom.programs.qutebrowser;
in {
  options.custom.programs.qutebrowser.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    hm'.programs.qutebrowser = {
      enable = true;
    };
  };
}
