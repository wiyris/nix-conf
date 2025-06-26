{
  config,
  pkgs,
  lib,
  ...
}: let
  cfg = config.custom.programs.core-utils;
in {
  options.custom.programs.core-utils.enable = lib.mkEnableOption {};

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      git
      vim
      neovim
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
      unrar
      unzip
      p7zip
      wget # download http/ftp
      ffmpeg # record, convert music/video
      ffmpegthumbnailer
      microfetch
      imagemagick # image editor
      scdl
      yt-dlp
      gtrash
    ];
  };
}
