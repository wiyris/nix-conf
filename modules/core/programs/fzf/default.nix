{
  config,
  lib,
  ...
}: let
  cfg = config.custom.programs.fzf;
in {
  options.custom.programs.fzf.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    hm.programs.fzf = {
      enable = true;
      enableFishIntegration = true;
      enableNushellIntegration = true;
      colors = lib.mkForce {};
      defaultOptions = [
        "--height 40%"
        "--reverse"
        "--border"
        "--color=16"
      ];
      defaultCommand = "rg --files --hidden --glob=!.git/";
    };
  };
}
