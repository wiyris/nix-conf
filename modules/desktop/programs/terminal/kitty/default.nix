{
  lib,
  config,
  ...
}: let
  cfg = config.custom.programs.kitty;
in {
  imports = [./dots/binds.nix];
  options.custom.programs.kitty = {
    enable = lib.mkEnableOption {};
    isDefault = lib.mkEnableOption {};
  };
  config = lib.mkMerge [
    (lib.mkIf cfg.isDefault {globals.defaultTerminal = "kitty";})
    (lib.mkIf cfg.enable {
      hm.programs.kitty = {
        enable = true;
        settings = {
          enable_audio_bell = false;
          close_on_child_death = true;
          cursor_blink_interval = 0;
          background_blur = 0;

          enabled_layouts = "fat, tall, vertical";
          wayland_titlebar_color = "background";

          allow_remote_control = true;
          listen_on = "unix:/tmp/kitty";
          dynamic_background_opacity = true;

          window_padding_width = 10;
          tab_bar_margin_width = 5;

          scrollback_pager = "less --chop-long-lines --raw-control-chars +INPUT_LINE_NUMBER";
        };
      };
    })
  ];
}
