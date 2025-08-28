{
  programs.nixvim.plugins.telescope = {
    enable = true;
    extensions.fzf-native.enable = true;
    extensions.zoxide.enable = true;
    keymaps = {
      "<leader><space>" = {
        action = "find_files";
        options = {
          desc = "Find project files";
        };
      };
      "<leader>b" = {
        action = "buffers";
        options = {
          desc = "Buffers";
        };
      };
      "<leader>ff" = {
        action = "find_files";
        options = {
          desc = "Find project files";
        };
      };
      "<leader>fg" = {
        action = "live_grep";
        options = {
          desc = "live grep";
        };
      };
      "<leader>fb" = {
        action = "buffers";
        options = {
          desc = "Buffers";
        };
      };
      "<leader>fr" = {
        action = "oldfiles";
        options = {
          desc = "Find recent edited files";
        };
      };
      "<leader>fc" = {
        action = "find_files";
        options = {
          desc = "Find files in ~/.config";
        };
      };
    };
  };
}
