{ pkgs, ... }:
{
  programs.yazi = {
    plugins = with pkgs.yaziPlugins; {
      inherit jump-to-char;
    };
    keymap.mgr.prepend_keymap = [
      {
        on = [ "f" ];
        run = "plugin jump-to-char";
        desc = "Jump to char";
      }
    ];
  };
}
