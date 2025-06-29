{
  lib,
  config,
  ...
}: let
  cfg = config.custom.programs.ghostty;
in {
  options.custom.programs.ghostty.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    hm = {
      stylix.targets.ghostty.enable = false;
      programs.ghostty = {
        enable = true;
        enableFishIntegration = true;
        settings = {
          background-blur-radius = 20;
          cursor-style = "block";
          cursor-style-blink = true;
          cursor-invert-fg-bg = false;

          # font-thicken = true;

          gtk-single-instance = true;
          # window-theme = "system";
          gtk-titlebar = false;
          gtk-wide-tabs = false;
          gtk-adwaita = false;

          macos-titlebar-style = "hidden";
          macos-option-as-alt = true;
          mouse-hide-while-typing = true;

          confirm-close-surface = false;
          window-padding-x = 12;
          window-padding-y = 10;
          window-padding-balance = true;

          # extras
          shell-integration-features = "no-cursor";
          copy-on-select = "clipboard";
        };
      };
    };
  };
}
