{
  lib,
  pkgs,
  ...
}: {
  programs.tmux = {
    plugins = with pkgs.tmuxPlugins; [tmux-floax];
    extraConfig = ''
      set -g @floax-bind '-n M-f'
    '';
  };
}
