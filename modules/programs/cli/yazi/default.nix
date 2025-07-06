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

      yaziPlugins.git
      yaziPlugins.yatline
      yaziPlugins.starship
      yaziPlugins.yatline-githead
      yaziPlugins.yatline-catppuccin
      # yaziPlugins.sudo
      # yaziPlugins.chmod
      # yaziPlugins.restore
      # yaziPlugins.lazygit
      # yaziPlugins.relative-motions
      # yaziPlugins.jump-to-char
      # yaziPlugins.full-border
    ];
    hm.programs.yazi = {
      enable = true;
      enableFishIntegration = true;
      shellWrapperName = "y";
    };
  };
}
