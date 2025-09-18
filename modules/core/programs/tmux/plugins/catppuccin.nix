{pkgs, ...}: {
  programs.tmux = {
    plugins = with pkgs.tmuxPlugins; [catppuccin];
    extraConfig = ''
      set -g @catppuccin_flavor 'mocha'
      set -g @catppuccin_status_background 'none'
      set -g @catppuccin_window_status_style 'none'

      # Run plugin
      run-shell ${pkgs.tmuxPlugins.catppuccin}/share/tmux-plugins/catppuccin/catppuccin.tmux

      set -g window-status-separator ""
      set -g status-left-length 0
      set -g status-left "#[fg=#{@thm_fg} bold]TMUX (#S) "
      set -ga status-left "#{?client_prefix,#[fg=#{@thm_red} bold]PREFIX ,#{?#{==:#{pane_mode},copy-mode},#[fg=#{@thm_yellow} bold]COPY ,#[fg=#{@thm_green} bold]NORMAL }}"
      set -g status-right ""
    '';
  };
}
