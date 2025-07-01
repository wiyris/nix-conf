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
      number = true;
      relativenumber = true;
      tabstop = 2;
      softtabstop = 2;
      showtabline = 2;
      shiftwidth = 2;
      expandtab = true;
      smartindent = true;
      breakindent = true;

      # search
      incsearch = true;
      hlsearch = true;
    };
  };
}
