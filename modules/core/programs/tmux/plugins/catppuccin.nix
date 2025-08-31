{pkgs, ...}: {
  programs.tmux = {
    plugins = with pkgs.tmuxPlugins; [catppuccin];
    extraConfig = ''
      set -g @catppuccin_flavor 'mocha'
      set -g @catppuccin_status_background 'none'
      set -g @catppuccin_window_status_style 'none'

      run-shell ${pkgs.tmuxPlugins.catppuccin}/share/tmux-plugins/catppuccin/catppuccin.tmux

      set -g status-right-length 100
      set -g status-left-length 100
      set -g status-left ""
      set -g status-right "#{E:@catppuccin_status_application}"
      set -ag status-right "#{E:@catppuccin_status_session}"
      # set -ag status-right "#{E:@catppuccin_status_uptime}"
    '';
  };
}
