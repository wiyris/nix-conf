{
  lib,
  pkgs,
  config,
  ...
}: let
  cfg = config.custom.programs.foot;
  foot-scratch = pkgs.writeShellScriptBin "foot-scratch" ''
    #!/usr/bin/env bash
    foot --app-id foot-scratchpad
  '';
in {
  options.custom.programs.foot.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    hm.home.packages = [foot-scratch];
    hm.programs.foot = {
      enable = true;
      settings = {
        main = {
          pad = "4x2";
        };
      };
    };
  };
}
