{
  config,
  lib,
  ...
}: let
  cfg = config.custom.programs.aria2;
  inherit (config.globals) homeDirectory;
in {
  options.custom.programs.aria2.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    hm = {
      programs.aria2c = {
        enable = true;
        settings = {
          max-connection-per-serve = 16;
          split = 16;
          continue = true;
          dir = "${homeDirectory}/Downloads";
        };
      };
      home.shellAliases = {
        ac = "aria2c";
      };
    };
  };
}
