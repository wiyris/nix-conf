{
  config,
  lib,
  ...
}: let
  cfg = config.custom.programs.bat;
in {
  options.custom.programs.bat.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    hm'= {
      programs.bat = {
        enable = true;
        config = {
          theme = lib.mkForce "base16";
        };
      };

      home.shellAliases = {
        cat = "bat --plain";
      };
    };
  };
}
