{
  config,
  lib,
  ...
}: let
  cfg = config.custom.programs.ripgrep;
in {
  options.custom.programs.ripgrep.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    hm'.programs.ripgrep = {
      enable = true;
      arguments = [
        "--max-columns=2000"
        "--smart-case"
      ];
    };
  };
}
