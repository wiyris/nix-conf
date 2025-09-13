{
  programs.nixvim = {
    plugins.snacks.settings.picker.enable = true;
    keymaps = [
      {
        mode = "n";
        key = "<leader><space>";
        action = ''<cmd>lua Snacks.picker.smart()<cr>'';
        options = {
          desc = "Smart Find Files";
        };
      }
      {
        mode = "n";
        key = "<leader>,";
        action = ''<cmd>lua Snacks.picker.buffers()<cr>'';
        options = {
          desc = "Find buffers";
        };
      }
      {
        mode = "n";
        key = "<leader>fb";
        action = ''<cmd>lua Snacks.picker.buffers()<cr>'';
        options = {
          desc = "Find buffers";
        };
      }
      {
        mode = "n";
        key = "<leader>ff";
        action = ''<cmd>lua Snacks.picker.files()<cr>'';
        options = {
          desc = "Find files";
        };
      }
      {
        mode = "n";
        key = "<leader>fF";
        action = ''<cmd>lua Snacks.picker.files({hidden = true, ignored = true})<cr>'';
        options = {
          desc = "Find files (All files)";
        };
      }
      {
        mode = "n";
        key = "<leader>fp";
        action = ''<cmd>lua Snacks.picker.projects()<cr>'';
        options = {
          desc = "Find projects";
        };
      }
      {
        mode = "n";
        key = "<leader>fq";
        action = ''<cmd>lua Snacks.picker.qflist()<cr>'';
        options = {
          desc = "Find quickfix";
        };
      }
    ];
  };
}
