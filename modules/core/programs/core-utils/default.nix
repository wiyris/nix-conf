{
  config,
  pkgs,
  lib,
  ...
}: let
  cfg = config.programs'.core-utils;
in {
  options.programs'.core-utils.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      age
      curl
      ffmpeg # record, convert music/video
      ffmpegthumbnailer
      file # print filetype
      git
      gnupg
      gtrash
      imagemagick # image editor
      jq # manipulate JSON
      killall
      lsof # print port process
      p7zip
      pinentry
      unar
      unzip
      vim
      wget
      wget # download http/ftp
      yq # manipulate YAML
    ];
  };
}
