let
  mkKeymap = mode: key: action: {
    inherit mode key action;
    options = {
      silent = true;
    };
  };

  mkNormap = key: action: (mkKeymap "n" key action);
  mkInsmap = key: action: (mkKeymap "i" key action);
  mkVismap = key: action: (mkKeymap "v" key action);
in
{
  keymaps = [
    (mkNormap "Y" "y$") # Y to EOL
    # (mkNormap "<ESC>" "<cmd>nohlsearch<CR>")
    # (mkNormap "<leader>s" ":sort")
    (mkVismap ">" ">gv")
    (mkVismap "<" "<gv")
  ];
}
