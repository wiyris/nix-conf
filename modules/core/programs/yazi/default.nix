{
  lib,
  pkgs,
  config,
  ...
}: let
  cfg = config.custom.programs.yazi;
in {
  options.custom.programs.yazi.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    hm = {
      home.packages = with pkgs; [
        ffmpeg
        ffmpegthumbnailer
        p7zip
        jq
        fd
        ripgrep
        fzf
        zoxide
        resvg
        imagemagick
      ];
      programs.yazi = {
        enable = true;
        enableFishIntegration = true;
        shellWrapperName = "y";
        plugins = with pkgs.yaziPlugins; {
          inherit git starship full-border;
        };
        settings = {
          mgr = {
            layout = [1 4 3];
            sort_by = "natural";
            sort_sensitive = false;
            sort_reverse = false;
            sort_dir_first = true;
            linemode = "none";
            show_hidden = false;
            show_symlink = true;
          };
          preview = {
            tab_size = 2;
            max_width = 600;
            max_height = 900;
          };
          plugin.prepend_fetchers = [
            {
              id = "git";
              name = "*";
              run = "git";
            }
            {
              id = "git";
              name = "*/";
              run = "git";
            }
          ];
        };
        initLua =
          # lua
          ''
            require("git"):setup()
            require("starship"):setup()
            require("full-border"):setup({
              type = ui.Border.ROUNDED,
            })
            require("zoxide"):setup({
              update_db = false,
            })
            require("session"):setup({
              sync_yanked = true,
            })
          '';
      };
    };
  };
}
