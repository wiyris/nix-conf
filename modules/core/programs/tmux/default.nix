{
  lib,
  pkgs,
  config,
  ...
}: let
  cfg = config.custom.programs.tmux;
  inherit (config.globals) defaultShell;
  shell = "${pkgs.${defaultShell}}/bin/${defaultShell}";
in {
  options.custom.programs.tmux.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    hm = {
      stylix.targets.tmux.enable = false;
      programs.tmux = {
        enable = true;
        inherit shell;
        mouse = true;
        escapeTime = 0;
        aggressiveResize = true;
        terminal = "screen-256color";

        imports = [
          ./dots/binds.nix
          ./plugins/catppuccin.nix
        ];

        extraConfig = ''
          set -g status-position top
          set -Fg 'status-format[1]' '#{status-format[0]}'
          set -g 'status-format[1]' ""
          set -g status 2
        '';
        plugins = with pkgs.tmuxPlugins; [
          tmux-fzf
          fingers
          # tmux-thumbs
        ];
      };

      programs.fzf.tmux.enableShellIntegration = true;
      programs.fish.shellAbbrs = {
        t = "tmux new-session";
        ta = "tmux attach -t";
        tl = "tmux list-sessions";
        tk = "tmux kill-session -t";
      };
    };
  };
}
