{
  imports = [
    ./cmp.nix
    ./comment.nix
    ./lsp.nix
    ./neotree.nix
    ./telescope.nix
    ./tree-sitter.nix
    ./which-key.nix
    ./trouble.nix
    ./yazi.nix
  ];

  programs.nixvim = {
    plugins = {
      illuminate.enable = true;
      indent-blankline.enable = true;
      web-devicons.enable = true;
      bufferline.enable = true;
      colorizer.enable = true;
      nvim-autopairs.enable = true;
      lz-n.enable = true; # lazy loading
      notify.enable = true;
      lualine.enable = true;
      noice.enable = true;
    };
  };
}
