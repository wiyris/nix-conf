{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.programs'.helix;
in {
  options.programs'.helix.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    hm' = {
      home.packages = with pkgs; [
        marksman
        nil
        nixd
        yaml-language-server
      ];
      imports = [
        ./dots/binds.nix
        ./dots/languages.nix
      ];
      programs.helix = {
        enable = true;
        package = pkgs.evil-helix;
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
            # clipboard-provider = "wayland";
            clipboard-provider = "tmux";
          };
        };
      };
    };
  };
}
