{
  lib,
  config,
  ...
}: let
  cfg = config.programs'.zellij;
in {
  options.programs'.zellij.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    hm' = {
      programs.zellij = {
        enable = true;
        # enableFishIntegration = lib.mkIf config.programs.fish.enable true;
        themes = {
          stylix = {
            themes = {
              default = {
                frame_selected = {
                  base = lib.mkForce "#89b4fa";
                };
              };
            };
          };
        };
      };
      home.shellAliases = {
        ij = "zellij";
      };
    };
  };
}
