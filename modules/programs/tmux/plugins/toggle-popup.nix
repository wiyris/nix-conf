{ pkgs, ... }:
{
  programs.tmux = {
    plugins = [ pkgs.tmuxPlugins.tmux-toggle-popup ];
    extraConfig = ''
      # Turn on autostart to boost the first call of @popup-toggle.
      set -g  @popup-autostart on
      bind -n M-f run "#{@popup-toggle} -Ed'#{pane_current_path}' -w75% -h75%"
      bind -n M-g run "#{@popup-toggle} -w90% -h90% -Ed'{popup_caller_pane_path}' --name=lazygit lazygit"
    '';
  };
}
