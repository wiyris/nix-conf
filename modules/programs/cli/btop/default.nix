{
  lib,
  pkgs,
  config,
  ...
}: let
  cfg = config.custom.programs.btop;
  btop-scratchpad = pkgs.writeShellScriptBin "btop-scratchpad" ''
    #!/usr/bin/env bash
    ghostty --class="btop.scratch" --background-opacity="0.2" -e btop
  '';
in {
  options.custom.programs.btop.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    hm.home.packages = [btop-scratchpad];
    hm.programs.btop = {
      enable = true;
      settings = {
        theme_background = false;
        truecolor = true;
        force_tty = false;
        vim_keys = true;
        rounded_corners = true;
        graph_symbol = "braille";
        update_ms = 200;
        proc_sorting = "cpu direct";
      };
    };
  };
}
