{
  imports = [
    ./catppuccin.nix
    ./ts-comments.nix
    # ./lsp.nix
    ./tree-sitter.nix
    ./which-key.nix
    # ./trouble.nix
    ./yazi.nix
    ./snacks.nix

    ./mini.nix
    ./noice.nix
  ];

  programs.nixvim = {
    plugins = {
      # bufferline.enable = true;
      nui.enable = true;
      lz-n.enable = true; # lazy loading
      lualine.enable = true;
    };
  };
}
