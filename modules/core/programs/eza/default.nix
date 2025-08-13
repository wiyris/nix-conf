{
  config,
  lib,
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
        extraOptions = [
          "--icons"
        ];
      };
      home.shellAliases = {
        # t = "tree";
        tree = "eza --all --long --tree";
      };
    };
  };
}
