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
      imports = [./dots/binds.nix];
      programs.zellij = {
        enable = true;
        # enableFishIntegration = true;
        themes.stylix.themes.default.frame_selected.base = lib.mkForce "#f5c2e7";
      };
      programs.fish.shellAbbrs = {
        j = "zellij";
        ja = "zellij attach";
      };
    };
  };
}
