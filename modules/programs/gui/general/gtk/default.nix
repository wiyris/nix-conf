{
  pkgs,
  config,
  lib,
  ...
}: let
  cfg = config.custom.programs.gtk;
in {
  options.custom.programs.gtk.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs;
      [
        thunderbird
      ]
      ++ lib.optionals config.bloat.enable [
        gimp3
        grayjay
        gpu-screen-recorder-gtk
      ];
    programs.gpu-screen-recorder.enable = true;
  };
}
