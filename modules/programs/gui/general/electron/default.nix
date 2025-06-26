{
  pkgs,
  config,
  lib,
  ...
}: let
  cfg = config.custom.programs.electron;
in {
  options.custom.programs.electron.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs;
      [
        vesktop
        obsidian
      ]
      ++ lib.optionals config.bloat.enable [freetube];
  };
}
