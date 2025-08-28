{
  programs.nixvim = {
    plugins.cmp-nvim-lsp.enable = true;
    plugins.lsp-format.enable = true;

    plugins.lsp = {
      enable = true;

      servers = {
        clangd.enable = true;
        marksman.enable = true;
        bashls.enable = true;
        nixd.enable = true;
      };
    };
  };
}
