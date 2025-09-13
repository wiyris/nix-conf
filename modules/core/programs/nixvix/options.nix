{pkgs, ...}: {
  programs.nixvim = {
    globals.mapleader = " ";

    clipboard = {
      register = "unnamedplus";
      providers.wl-copy = {
        enable = true;
        package = pkgs.wl-clipboard-rs;
      };
    };

    opts = {
      # Basic settings
      number = true;
      relativenumber = true;
      cursorline = true;
      pumblend = 10;
      pumheight = 10;
      shortmess = "I";

      # Indentation
      tabstop = 2;
      softtabstop = 2;
      showtabline = 2;
      shiftwidth = 2;
      expandtab = true;
      smartindent = true;
      autoindent = true;
      # breakindent = true;

      # Search settings
      ignorecase = true;
      incsearch = true;
      smartcase = true;
      hlsearch = false;

      # Folding settings
      foldmethod = "expr";
      foldexpr = "v:lua.vim.treesitter.foldexpr()";
      foldlevel = 99;
    };
  };
}
