{
  lib,
  config,
  ...
}: let
  cfg = config.programs'.helix;
in {
  options.programs'.helix.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    hm'.programs.helix = {
      enable = true;
      settings = {
        theme = lib.mkForce "catppuccin_mocha";
        editor = {
          color-modes = true;
          cursorline = true;
          bufferline = "multiple";
          line-number = "relative";
          cursor-shape = {
            insert = "bar";
            normal = "block";
            select = "underline";
          };
          true-color = true;
          indent-guides = {
            render = true;
            rainbow-option = "dim";
          };
          lsp = {
            display-messages = true;
            display-inlay-hints = true;
          };
          auto-pairs = true;
          clipboard-provider = "wayland";
        };
      };
    };
  };
}
