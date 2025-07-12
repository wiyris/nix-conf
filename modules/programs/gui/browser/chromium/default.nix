{
  lib,
  pkgs,
  config,
  ...
}: let
  cfg = config.custom.programs.chromium;
  kagi-scratchpad = pkgs.writeShellScriptBin "kagi-scratchpad" ''
    #!/usr/bin/env bash
    chromium --app="https://kagi.com/assistant"
  '';
  kagi-translate-scratchpad = pkgs.writeShellScriptBin "kagi-translate-scratchpad" ''
    #!/usr/bin/env bash
    chromium --app="https://translate.kagi.com/"
  '';
in {
  options.custom.programs.chromium.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    hm = {
      home.package = [
        kagi-scratchpad
        kagi-translate-scratchpad
      ];
      programs.chromium = {
        enable = true;
        package = pkgs.ungoogled-chromium;
      };
    };
  };
}
