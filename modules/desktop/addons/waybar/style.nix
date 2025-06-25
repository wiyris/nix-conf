{
  lib,
  pkgs,
  ...
}: {
  config.hm = {
    stylix.targets.waybar.addCss = false;
    home.packages = [pkgs.nerd-fonts.noto];
    programs.waybar.style = lib.mkAfter ''
      @define-color dark #1d2021;
      * { background: @base00; padding:0 7px; }
      * { font-family: NotoSans Nerd Font; font-weight: bold; font-size: 18px; }

      #idle_inhibitor { font-size: 22pt; }
      #idle_inhibitor.activated { color: @base0C; }

      #workspaces * { font-size: 12px; padding: 1px; }
      #workspaces button { color: @base0C; }
      #workspaces button.empty { color: @base02; }
      #workspaces button.active { color: @base0E; }

      #network.disconnected { color: @base0E; }

      #pulseaudio { min-width: 65px; }
      #pulseaudio.muted { color: @base08; }

      #battery { color: @base05; }
      #battery.warning { color: @base0A; }
      #battery.critical { color: @base0E; }
      #battery.charging { color: @base0D; }

      #tray * { padding: 0; }
    '';
  };
}
