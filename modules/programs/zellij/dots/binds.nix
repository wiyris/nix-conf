{
  programs.zellij.settings.keybinds = {
    normal._children = [
      {
        bind = {
          _args = ["Alt n"];
          GoToTab = 1;
        };
      }
      {
        bind = {
          _args = ["Alt t"];
          GoToTab = 2;
        };
      }
      {
        bind = {
          _args = ["Alt h"];
          GoToTab = 3;
        };
      }
      {
        bind = {
          _args = ["Alt p"];
          GoToTab = 4;
        };
      }
      {
        bind = {
          _args = ["Alt d"];
          GoToTab = 5;
        };
      }
    ];
  };
}
