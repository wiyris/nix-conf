{
  lib,
  config,
  ...
}: let
  cfg = config.custom.programs.ghostty;
in {
  options.custom.programs.ghostty = {
    enable = lib.mkEnableOption {};
    isDefault = lib.mkEnableOption {};
  };
  config = lib.mkMerge [
    (lib.mkIf cfg.isDefault {globals.defaultTerminal = "ghostty";})
    (lib.mkIf cfg.enable {
      hm' = {
        # stylix.targets.ghostty.enable = false;
        programs.ghostty = {
          enable = true;
          enableFishIntegration = true;
          settings = {
            theme = "catppuccin-mocha";
            # background-blur-radius = 20;
            # background-opacity = 0.3;

            font-family = ["" "config.stylix.fonts.monospace"]; # disable fallback noto emoji

            cursor-style = "block";
            cursor-style-blink = true;
            cursor-invert-fg-bg = false;

            # font-thicken = true;

            gtk-single-instance = true;
            window-theme = "system";
            gtk-titlebar = false;
            gtk-wide-tabs = false;
            gtk-adwaita = false;

            macos-titlebar-style = "hidden";
            macos-option-as-alt = true;
            mouse-hide-while-typing = true;

            confirm-close-surface = false;
            window-padding-x = [4 5];
            window-padding-y = [4 5];
            window-padding-balance = false;

            # extras
            shell-integration-features = "no-cursor";
            copy-on-select = "clipboard";
          };
        };
      };
    })
  ];
}
