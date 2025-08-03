{
  programs.tmux = {
    keyMode = "vi";
    prefix = "M-Space";
    extraConfig = ''
      # Config reload
      bind C-r source-file ~/.config/tmux/tmux.conf \; display-message "tmux.conf reloaded"
      bind 'v' copy-mode
    '';
  };
}
