{
  config.hm'.programs.kitty = {
    settings = {kitty_mod = "ctrl+shift";};
    keybindings = {
      "ctrl+c" = "copy_and_clear_or_interrupt";
      # "ctrl+v" = "paste_from_clipboard";
      "ctrl+=" = "change_font_size all +1.0";
      "ctrl+-" = "change_font_size all -1.0";
      "ctrl+0" = "restore_font_size";

      # "kitty_mod+a" = "scroll_line_down";
      # "kitty_mod+e" = "scroll_line_up";
      "kitty_mod+down" = "scroll_line_down";
      "kitty_mod+up" = "scroll_line_up";
      "kitty_mod+home" = "scroll_home";
      "kitty_mod+end" = "scroll_end";

      "kitty_mod+h" = "kitty_scrollback_nvim";
      "kitty_mod+g" = "kitty_scrollback_nvim --config ksb_builtin_last_cmd_output";

      # hints
      "kitty_mod+f>l" = "open_url_with_hints";
      "kitty_mod+f>n" = "kitten hints --type=linenum --linenum-action=tab nvim +{line} {path}";
      "kitty_mod+f>y" = "kitten hints --type hyperlink";
      "kitty_mod+f>f" = "kitten hints --type path";
      "kitty_mod+f>shift+F" = "kitten hints --type path --program -";

      "kitty_mod+f5" = "load_config_file";
    };
  };
}
