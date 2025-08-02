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
      imports = [./dots/binds.nix];
      programs.tmux = {
        enable = true;
        inherit shell;
        mouse = true;
        escapeTime = 0;

        keyMode = "vi";

        plugins = with pkgs.tmuxPlugins; [
          catppuccin
          tmux-fzf
        ];
      };
      programs.fzf.tmux.enableShellIntegration = true;
      programs.fish.shellAbbrs = {
        tn = "tmux new-session -s";
        ta = "tmux attach -t";
        tl = "tmux list-sessions";
        tk = "tmux kill-session -t";
      };
    };
  };
}
