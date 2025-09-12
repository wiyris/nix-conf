{
  config,
  lib,
  ...
}: let
  cfg = config.custom.programs.zoxide;
in {
  options.custom.programs.zoxide.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    hm'.programs.zoxide = {
      enable = true;
      enableFishIntegration = true;
      enableNushellIntegration = true;
      options = ["--cmd f"];
    };
  };
}
