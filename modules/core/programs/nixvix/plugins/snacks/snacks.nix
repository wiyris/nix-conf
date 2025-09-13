{
  programs.nixvim = {
    plugins.snacks = {
      enable = true;
      settings = {
        indent = {
          enable = true;
        };
        # input = {
        #   enable = true;
        # };
        # bigfile = {
        #   enabled = true;
        # };
        notifier = {
          enabled = true;
          timeout = 3000;
        };
        quickfile = {
          enabled = true;
        };
        statuscolumn = {
          enabled = true;
        };
        scope = {
          enable = true;
        };
      };
    };
  };
}
