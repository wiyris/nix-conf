{
  programs.nixvim = {
    plugins.yazi = {
      enable = true;
      lazyLoad = {settings = {cmd = ["Yazi"];};};

      settings.keymaps = {
        change_working_directory = "<c-w>";

        copy_relative_path_to_selected_files = "<c-y>";
        cycle_open_buffers = "<tab>";
        grep_in_directory = "<c-s>";
        open_file_in_horizontal_split = "<c-x>";
        open_file_in_tab = "<c-t>";
        open_file_in_vertical_split = "<c-v>";
        replace_in_directory = "<c-g>";
        send_to_quickfix_list = "<c-q>";
        show_help = "<f1>";
      };
    };

    keymaps = [
      {
        mode = "n";
        key = "<leader>-";
        action = "<CMD>Yazi<CR>";
        options = {desc = "Yazi (current file)";};
      }
      {
        mode = "n";
        key = "<leader>E";
        action = "<CMD>Yazi toggle<CR>";
        options = {desc = "Yazi (resume)";};
      }
    ];
  };
}
