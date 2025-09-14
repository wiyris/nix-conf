{
  programs.tmux = {
    keyMode = "vi";
    # prefix = "C-a";
    extraConfig = ''
      # Vim mode
      setw -g mode-keys vi
      set -g status-keys vi
      bind 'v' copy-mode
      bind -n M-v copy-mode
      bind -T copy-mode-vi v send -X begin-selection
      bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel "wl-copy"
      bind -T copy-mode-vi Escape send-keys -X copy-pipe-and-cancel "wl-copy"
      bind p paste-buffer
      bind -T copy-mode-vi MouseDragEnd1Pane send-keys -X copy-pipe-and-cancel "wl-copy"

      # Config reload
      bind -n M-r source-file ~/.config/tmux/tmux.conf \; display-message "tmux.conf reloaded"

      # General configs
      bind -n M-C-q detach
      bind -n M-q kill-pane
      bind -n M-Q kill-window

      # bind -n M-Space split-window -h
      bind -n M-Space split-window -h -p 35
      bind -n M-C-Space split-window -v

      bind -n M-n if-shell 'tmux list-windows | grep -q "^1:"' 'select-window -t 1' 'new-window -t 1'
      bind -n M-t if-shell 'tmux list-windows | grep -q "^2:"' 'select-window -t 2' 'new-window -t 2'
      bind -n M-h if-shell 'tmux list-windows | grep -q "^3:"' 'select-window -t 3' 'new-window -t 3'
      bind -n M-p if-shell 'tmux list-windows | grep -q "^4:"' 'select-window -t 4' 'new-window -t 4'
      bind -n M-d if-shell 'tmux list-windows | grep -q "^5:"' 'select-window -t 5' 'new-window -t 5'
      # bind -n M-f if-shell 'tmux list-windows | grep -q "^1:"' 'select-window -t 1' 'new-window -t 1'
      # bind -n M-p if-shell 'tmux list-windows | grep -q "^2:"' 'select-window -t 2' 'new-window -t 2'
      # bind -n M-d if-shell 'tmux list-windows | grep -q "^3:"' 'select-window -t 3' 'new-window -t 3'
      # bind -n M-l if-shell 'tmux list-windows | grep -q "^4:"' 'select-window -t 4' 'new-window -t 4'
      # bind -n M-x if-shell 'tmux list-windows | grep -q "^5:"' 'select-window -t 5' 'new-window -t 5'
      # bind -n M-";" if-shell 'tmux list-windows | grep -q "^6:"' 'select-window -t 6' 'new-window -t 6'
      # bind -n M-u if-shell 'tmux list-windows | grep -q "^7:"' 'select-window -t 7' 'new-window -t 7'
      # bind -n M-o if-shell 'tmux list-windows | grep -q "^8:"' 'select-window -t 8' 'new-window -t 8'
      # bind -n M-y if-shell 'tmux list-windows | grep -q "^9:"' 'select-window -t 9' 'new-window -t 9'

      # Move to each pane
      bind -n M-i select-pane -R
      bind -n M-, select-pane -L
      bind -n M-e select-pane -U
      bind -n M-a select-pane -D

      # Resize each pane
      bind -n M-"-" resize-pane -L 5
      bind -n M-"=" resize-pane -R 5
      bind -n M-"'" resize-pane -U 2
      bind -n M-"." resize-pane -D 2

      # Swap windows
      bind -n M-"<" swap-window -d -t -1
      bind -n M-">" swap-window -d -t +1

      # Plugins
      ## tmux-fingers
      bind -n M-f run -b "#{@fingers-cli} start #{pane_id}"
      bind u run -b "#{@fingers-cli} start #{pane_id} --patterns url"
    '';
  };
}
