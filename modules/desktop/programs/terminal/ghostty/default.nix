{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.programs'.ghostty;
in {
  options.programs'.ghostty = {
    enable = lib.mkEnableOption {};
    isDefault = lib.mkEnableOption {};
  };
  config = lib.mkMerge [
    (lib.mkIf cfg.isDefault {globals.defaultTerminal = "ghostty";})
    (lib.mkIf cfg.enable {
      hm' = {
        programs.ghostty = {
          enable = true;
          enableFishIntegration = true;
          settings = {
            background-blur-radius = 17;
            font-feature = ["ss06"];
            font-family = ["" "config.stylix.fonts.monospace"]; # disable fallback noto emoji
            # adjust-cell-height = "28%";

            cursor-style = "block";
            cursor-style-blink = true;
            cursor-invert-fg-bg = false;
            font-thicken = true;

            macos-titlebar-style = "hidden";
            macos-option-as-alt = true;
            mouse-hide-while-typing = true;

            confirm-close-surface = false;
            window-decoration = false;
            window-padding-x = [4 5];
            window-padding-y = [4 0];
            window-padding-balance = true;

            # extras
            shell-integration-features = "no-cursor";
            copy-on-select = "clipboard";
          };
        };
      };
    })
  ];
}
