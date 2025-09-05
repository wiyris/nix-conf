{
  lib,
  pkgs,
  config,
  ...
}: let
  cfg = config.custom.programs.fish;
in {
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

      hm = {
        imports = [./abbrs.nix];
        xdg.configFile."fish/functions" = {
          source = ./functions;
          recursive = true;
          force = true;
        };

        programs.fish = {
          enable = true;
          # interactiveShellInit = ''
          #   ${pkgs.fortune}/bin/fortune -s | ${pkgs.cowsay}/bin/cowsay
          # '';

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
      };
    })
  ];
}
