{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.programs'.gpu-screen-recorder;
in
{
  options.programs'.gpu-screen-recorder.enable = lib.mkEnableOption { };
  config = lib.mkIf cfg.enable {
    programs.gpu-screen-recorder.enable = true;
    environment.systemPackages = [ pkgs.gpu-screen-recorder-gtk ];
  };
}
