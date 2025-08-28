{
  programs.nixvim.plugins.snacks = {
    enable = true;
    settigs = {
      indent = {
        enable = true;
      };
      input = {
        enable = true;
      };
      bigfile = {
        enabled = true;
      };
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
      words = {
        debounce = 100;
        enabled = true;
      };
      scope = {
        enable = true;
      };
      scroll = {
        enable = true;
      };
      lazigit = {
        enable = true;
      };
    };
  };
}
