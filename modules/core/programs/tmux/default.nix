{
  lib,
  pkgs,
  config,
  ...
}: let
  cfg = config.programs'.tmux;
  inherit (config.globals) defaultShell;
  shell = "${pkgs.${defaultShell}}/bin/${defaultShell}";
in {
  options.programs'.tmux.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    hm' = {
      imports = [
        ./dots/binds.nix
        ./plugins/catppuccin.nix
        ./plugins/floax.nix
      ];
      programs.tmux = {
        enable = true;
        tmuxp.enable = true;
        inherit shell;
        mouse = true;
        escapeTime = 0;
        aggressiveResize = true;
        # terminal = "screen-256color";
        focusEvents = true;
        extraConfig = ''
          set -g status-position top

          # Start windows and panes at 1, not 0
          set -g base-index 1
          setw -g pane-base-index 1
        '';
        plugins = with pkgs.tmuxPlugins; [
          tmux-fzf
        ];
      };

      programs.fzf.tmux.enableShellIntegration = true;
      programs.fish.shellAbbrs = lib.mkIf config.programs.fish.enable {
        t = "tmux new-session";
        ta = "tmux attach -t";
        tl = "tmux list-sessions";
        tk = "tmux kill-session -t";
      };
    };
  };
}
