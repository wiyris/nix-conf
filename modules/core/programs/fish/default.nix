{
  lib,
  pkgs,
  config,
  ...
}: let
  cfg = config.custom.programs.fish;
in {
  imports = [
    ./dots/abbrs.nix
    ./dots/functions.nix
  ];
  options.custom.programs.fish = {
    enable = lib.mkEnableOption {};
    isDefault = lib.mkEnableOption {};
  };

  config = lib.mkMerge [
    (lib.mkIf cfg.isDefault {globals.defaultShell = "fish";})
    (lib.mkIf cfg.enable {
      environment.systemPackages = with pkgs.fishPlugins; [
        autopair
        done
        fzf-fish
      ];

      hm.programs.fish = {
        enable = true;

        shellInit =
          # fish
          ''
            set -U fish_greeting ""
            set -xg EDITOR nvim
            set -xg VISUAL $EDITOR
            set -xg SUDO_EDITOR $EDITOR

            set -xg fish_key_bindings fish_vi_key_bindings
            fish_default_key_bindings -M insert
            fish_vi_key_bindings --no-erase insert
            bind -M visual -m default y 'fish_clipboard_copy; commandline -f end-selection repaint-mode'
            bind yy fish_clipboard_copy
            bind p fish_clipboard_paste
            bind -M insert \e\z zi

            export PATH="$HOME/.local/bin:$PATH"
          '';
      };
    })
  ];
}
