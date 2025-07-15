{
  lib,
  pkgs,
  config,
  ...
}: let
  cfg = config.custom.programs.btop;
  btop-ghosttyscratch = pkgs.writeShellScriptBin "btop-ghosttyscratch" ''
    #!/usr/bin/env bash
    ghostty --class="btop.ghosttyscratch" --background-opacity="0.2" -e btop
  '';
  btop-kittyscratch = pkgs.writeShellScriptBin "btop-kittyscratch" ''
    #!/usr/bin/env bash
    kitty --class btop-kittyscratch --override background_opacity=0.2 -e btop
  '';
in {
  options.custom.programs.btop.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    hm.home.packages = [
      btop-ghosttyscratch
      btop-kittyscratch
    ];
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
