{
  lib,
  config,
  ...
}: let
  cfg = config.programs'.kitty;
in {
  imports = [./dots/binds.nix];
  options.programs'.kitty = {
    enable = lib.mkEnableOption {};
    isDefault = lib.mkEnableOption {};
  };
  config = lib.mkMerge [
    (lib.mkIf cfg.isDefault {globals.defaultTerminal = "kitty";})
    (lib.mkIf cfg.enable {
      hm'.programs.kitty = {
        enable = true;
        shellIntegration.enableFishIntegration = lib.mkIf config.programs.fish.enable true;
        enableGitIntegration = true;
        settings = {
          enable_audio_bell = false;
          # close_on_child_death = true;
          cursor_blink_interval = 1.0;
          # background_blur = 1;
          shell_integration = true;
          confirm_os_window_close = 2;
          mouse_hide_wait = 0.1;

          # enabled_layouts = "fat, tall, vertical";
          # wayland_titlebar_color = "background";

          allow_remote_control = true;
          listen_on = "unix:/tmp/kitty";
          # dynamic_background_opacity = true;

          window_padding_width = 7;
          # tab_bar_margin_width = 5;

          # scrollback_pager = "less --chop-long-lines --raw-control-chars +INPUT_LINE_NUMBER";
          # clipboard_control = "write-clipboard read-clipboard";
        };
      };
    })
  ];
}
