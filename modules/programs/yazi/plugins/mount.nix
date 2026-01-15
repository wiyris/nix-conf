{ pkgs, ... }:
{
  home.packages = with pkgs; [ ];
  programs.yazi = {
    plugins = with pkgs.yaziPlugins; {
      inherit mount;
    };
    keymap.mgr.prepend_keymap = [
      {
        on = [ "M" ];
        run = "plugin mount";
        desc = "";
      }
    ];
  };
}
