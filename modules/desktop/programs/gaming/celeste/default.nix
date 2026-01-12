{
  lib,
  pkgs,
  config,
  ...
}:
let
  cfg = config.gaming'.celeste;
in
{
  options.gaming'.celeste.enable = lib.mkEnableOption { };
  config = lib.mkIf cfg.enable {
    hm'.home.packages = with pkgs; [
      olympus
    ];
  };
}
