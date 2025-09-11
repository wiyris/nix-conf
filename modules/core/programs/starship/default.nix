{
  config,
  lib,
  ...
}: let
  cfg = config.custom.programs.starship;
in {
  options.custom.programs.starship.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    hm'.programs.starship = {
      enable = true;
      enableBashIntegration = false;
      enableFishIntegration = true;
      enableNushellIntegration = true;
    };
  };
}
