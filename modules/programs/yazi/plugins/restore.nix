{ pkgs, ... }:
{
  home.packages = with pkgs; [ trash-cli ];
  programs.yazi = {
    plugins = with pkgs.yaziPlugins; {
      inherit restore;
    };
    keymap.mgr.prepend_keymap = [
      {
        on = [ "u" ];
        run = "plugin restore";
        desc = "Restore last deleted files/folders";
      }

      # Select files/folders to restore. Input item index or range separated by comma:
      # - Restore a trashed file:
      #      What file to restore [0..4]: 4
      # - Restore multiple trashed files separated by comma, also support range:
      #      What file to restore [0..3]: 0-2, 3

      {
        on = [ "U" ];
        run = "plugin restore -- --interactive";
        desc = "Restore deleted files/folders (Interactive)";
      }

      # Or auto overwrite existed file/folder
      # {
      #   on = [ "U" ];
      #   run = "plugin restore -- --interactive --interactive-overwrite";
      #   desc = "Restore deleted files/folders (Interactive overwrite)";
      # }

    ];
  };
}
