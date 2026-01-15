{
  lib,
  pkgs,
  config,
  ...
}:
let
  cfg = config.programs'.fish;
in
{
  options.programs'.fish = {
    enable = lib.mkEnableOption { };
    isDefault = lib.mkEnableOption { };
  };

  config = lib.mkMerge [
    (lib.mkIf cfg.isDefault {
      globals.defaultShell = "fish";
      user'.shell = pkgs.fish;
    })
    (lib.mkIf cfg.enable {
      programs.fish.enable = true;
      environment.systemPackages = with pkgs.fishPlugins; [
        autopair
        done
        fzf-fish
      ];

      hm' = {
        imports = [ ./abbrs.nix ];
        xdg.configFile."fish/functions" = {
          source = ./functions;
          recursive = true;
          force = true;
        };

        programs.fish = {
          enable = true;

          shellInit =
            # fish
            ''
              set -U fish_greeting ""
              set -xg NVIM_APPNAME lv
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

          functions = {
            f = # wav to flac
              # fish
              ''
                set ORIGINAL_SIZE (du -hs | cut -f1)

                fd -e wav -x ffmpeg -i "file:{}" -loglevel quiet -stats "file:{.}.flac"
                fd -e wav -X trash

                set NEW_SIZE (du -hs | cut -f1)

                echo "Done. Reduced file size from $ORIGINAL_SIZE to $NEW_SIZE"
              '';

            opus =
              # fish
              ''
                set ORIGINAL_SIZE (du -hs | cut -f1)

                fd -e wav -e flac -x ffmpeg -i "file:{}" -c:a libopus -b:a 128K -loglevel quiet -stats "file:{.}.opus"
                fd -e wav -e flac -X rm -I

                set NEW_SIZE (du -hs | cut -f1)

                echo "Done. Reduced file size from $ORIGINAL_SIZE to $NEW_SIZE"
              '';
          };
        };
      };
    })
  ];
}
