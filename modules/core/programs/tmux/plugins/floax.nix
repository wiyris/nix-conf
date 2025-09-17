{
  lib,
  pkgs,
  ...
}: {
  programs.tmux = {
    plugins = with pkgs.tmuxPlugins; [floax];
    extraConfig = ''
      set -g @floax-bind '-n M-f'
    '';
  };
}
