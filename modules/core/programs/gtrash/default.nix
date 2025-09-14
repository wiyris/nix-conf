{
  config,
  pkgs,
  lib,
  ...
}: let
  cfg = config.custom.programs.gtrash;
in {
  options.custom.programs.gtrash.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    hm'.home = {
      packages = [pkgs.gtrash];
      shellAliases = {
        tt = "gtrash put"; # to trash
        tr = "gtrash restore";
        ts = "gtrash summary";
      };
    };
  };
}
