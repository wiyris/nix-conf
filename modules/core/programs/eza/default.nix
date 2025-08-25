{
  lib,
  config,
  ...
}: let
  cfg = config.custom.programs.eza;
in {
  options.custom.programs.eza.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    hm = {
      programs.eza = {
        enable = true;
        enableFishIntegration = true;
        enableNushellIntegration = true;
        git = true;
        icons = "auto";
        colors = "always";
        extraOptions = [
          "--icons"
        ];
      };
      home.shellAliases = {
        tree = "eza --all --long --tree";
      };
    };
  };
}
