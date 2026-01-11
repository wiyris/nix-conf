{
  mgr.prepend_keymap = [
    {
      on = [ "D" ];
      run = "noop";
      # desc = "";
    }
    {
      on = [ "<C-w>" ];
      run = "close";
      # desc = "";
    }
    {
      on = [ "<C-PageUp>" ];
      run = "tab_switch -1 --relative";
      # desc = "";
    }
    {
      on = [ "<C-PageDown>" ];
      run = "tab_switch 1 --relative";
      # desc = "";
    }
    {
      on = [ "<" ];
      run = "tab_swap -1";
      # desc = "";
    }
    {
      on = [ ">" ];
      run = "tab_swap 1";
      # desc = "";
    }
  ];
}
