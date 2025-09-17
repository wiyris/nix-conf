{
  config.hm'.programs.kitty = {
    settings = {kitty_mod = "alt+ctrl";};
    keybindings = {
      "ctrl+c" = "copy_and_clear_or_interrupt";
      "ctrl+v" = "paste_from_clipboard";
      "kitty_mod+=" = "increase_font_size";
      "kitty_mod+-" = "decrease_font_size";
      "kitty_mod+0" = "restore_font_size";
      # "kitty_mod+up" = "scroll_line_up";
      "kitty_mod+e" = "scroll_line_up";
      # "kitty_mod+down" = "scroll_line_down";
      "kitty_mod+a" = "scroll_line_down";

      # Window management
      # "kitty_mod+enter" = "new_window";
      # "kitty_mod+l" = "next_window";
      # "kitty_mod+p" = "previous_window";
      # "kitty_mod+u" = "move_window_forward";
      # "kitty_mod+o" = "move_window_backward";

      # Tab management
      # "kitty_mod+right" = "next_tab";
      # "kitty_mod+i" = "next_tab";
      # "kitty_mod+left" = "previous_tab";
      # "kitty_mod+," = "previous_tab";
      # "kitty_mod+;" = "move_tab_forward";
      # "kitty_mod+y" = "move_tab_backward";
      # "kitty_mod+t" = "new_tab";
      # "kitty_mod+q" = "close_tab";
      # "kitty_mod+n" = "set_tab_title";
      # "kitty_mod+d" = "next_layout";
    };
  };
}
