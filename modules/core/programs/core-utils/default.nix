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
      git
      gnupg
      pinentry
      vim
      curl
      wget
      file # print filetype
      jq # manipulate JSON
      yq # manipulate YAML
      killall
      lsof # print port process
      nix-prefetch-git # get fetchgit hashes
      nix-serve # create a local nix cachix like server
      nurl # get fetchgit hashes
      unar
      unzip
      p7zip
      wget # download http/ftp
      ffmpeg # record, convert music/video
      ffmpegthumbnailer
      imagemagick # image editor
      gtrash
    ];
  };
}
