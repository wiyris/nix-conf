{
  config,
  inputs,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.programs'.helium-browser;
in
{
  options.programs'.helium-browser.enable = lib.mkEnableOption { };
  config = lib.mkIf cfg.enable {
    hm' = {
      imports = [ ];
      home.packages = with pkgs; [
        inputs.helium.packages.${stdenv.hostPlatform.system}.default
      ];
    };
  };
}
