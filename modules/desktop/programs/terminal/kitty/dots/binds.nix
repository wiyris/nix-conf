{
  config.hm'.programs.kitty = {
    settings = {kitty_mod = "alt+ctrl";};
    keybindings = {
      "ctrl+c" = "copy_and_clear_or_interrupt";
      "kitty_mod+=" = "increase_font_size";
      "kitty_mod+-" = "decrease_font_size";
      "kitty_mod+0" = "restore_font_size";
      # "kitty_mod+up" = "scroll_line_up";
      "kitty_mod+e" = "scroll_line_up";
      # "kitty_mod+down" = "scroll_line_down";
      "kitty_mod+a" = "scroll_line_down";

      # hints
      # "kitty_mod+f>l" = "open_url_with_hints";
      # "kitty_mod+f>n" = "kitten hints --type=linenum --linenum-action=tab nvim +{line} {path}";
      # "kitty_mod+f>y" = "kitten hints --type hyperlink";
      # "kitty_mod+f>f" = "kitten hints --type path";
      # "kitty_mod+f>shift+F" = "kitten hints --type path --program -";
    };
  };
}
