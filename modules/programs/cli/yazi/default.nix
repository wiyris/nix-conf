{
  config,
  pkgs,
  lib,
  ...
}: let
  cfg = config.custom.programs.yazi;
in {
  options.custom.programs.yazi.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      ffmpeg
      ffmpegthumbnailer
      p7zip
      jq
      fd
      ripgrep
      fzf
      zoxide
      resvg
      imagemagick
    ];
    hm = {
      imports = [./plugins];
      programs.yazi = {
        enable = true;
        enableFishIntegration = true;
        shellWrapperName = "y";
      };
    };
  };
}
