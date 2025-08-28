{...}: let
  mkKeymap = mode: key: action: {
    inherit mode key action;
    options = {
      silent = true;
    };
  };

  mkNormap = key: action: (mkKeymap "n" key action);
  mkInsmap = key: action: (mkKeymap "i" key action);
  mkVismap = key: action: (mkKeymap "v" key action);
in {
  programs.nixvim.keymaps = [
    # (mkNormap "<leader>," "<C-w><C-h>")
    # (mkNormap "<leader>a" "<C-w><C-j>")
    # (mkNormap "<leader>e" "<C-w><C-k>")
    # (mkNormap "<leader>i" "<C-w><C-l>")
    # (mkNormap "<C-,>" ":vertical resize -2<CR>")
    # (mkNormap "<C-a>" ":resize +2<CR>")
    # (mkNormap "<C-e>" ":resize -2<CR>")
    # (mkNormap "<C-i>" ":vertical resize +2<CR>")
    # (mkNormap "<ESC>" "<cmd>nohlsearch<CR>")
    # (mkNormap "<leader>s" ":sort")
    # (mkVismap ">" ">gv")
    # (mkVismap "<" "<gv")
    # (mkVismap "<TAB>" ">gv")
    # (mkVismap "<S-TAB>" "<gv")
  ];
}
