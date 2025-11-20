{
  config,
  lib,
  ...
}: let
  cfg = config.programs'.aria2;
  inherit (config.globals) homeDirectory;
in {
  options.programs'.aria2.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    hm'= {
      programs.aria2 = {
        enable = true;
        settings = {
          max-connection-per-server = 16;
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
