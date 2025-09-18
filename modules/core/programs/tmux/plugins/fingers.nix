{
  lib,
  pkgs,
  ...
}: {
  programs.tmux = {
    plugins = with pkgs.tmuxPlugins; [fingers];
    extraConfig = ''
      bind -n M-F run -b "#{@fingers-cli} start #{pane_id}"
      bind u run -b "#{@fingers-cli} start #{pane_id} --patterns url"
    '';
  };
}
