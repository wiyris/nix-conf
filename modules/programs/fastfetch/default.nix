{
  lib,
  config,
  ...
}:
let
  cfg = config.programs'.fastfetch;
in
{
  options.programs'.fastfetch.enable = lib.mkEnableOption { };
  config = lib.mkIf cfg.enable {
    hm' = {
      home.shellAliases.ff = "fastfetch";
      programs.fastfetch = {
        enable = true;
        settings = {
          "$schema" = "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json";
          logo.source = ./icon.png;
          display = {
            separator = " ➜ ";
            color = "white";
          };
          modules = [
            {
              type = "custom";
              format = "┌──────────── Hardware Information ────────────┐";
            }
            {
              type = "cpu";
              key = "   CPU";
              keyColor = "blue";
            }
            {
              type = "board";
              key = "   Board";
              keyColor = "magenta";
            }
            {
              type = "gpu";
              format = "{2} {3}";
              key = "  󰛇 GPU";
              keyColor = "yellow";
            }
            {
              type = "memory";
              key = "   Memory";
              keyColor = "green";
            }
            {
              type = "display";
              key = "  󰍹 Display";
              keyColor = "cyan";
              compactType = "original";
            }
            # "break";
            {
              type = "custom";
              format = "├──────────── Software Information ────────────┤";
            }
            {
              type = "os";
              key = "   OS";
              keyColor = "blue";
            }
            {
              type = "kernel";
              key = "   Kernel";
              keyColor = "red";
            }
            {
              type = "shell";
              key = "   Shell";
              keyColor = "magenta";
            }
            {
              type = "wm";
              key = "   WM";
              keyColor = "cyan";
            }
            {
              type = "terminal";
              key = "   Terminal";
              keyColor = "yellow";
            }
            {
              type = "packages";
              key = "   Packages";
              keyColor = "green";
            }
            {
              type = "uptime";
              key = "  󱫐 Uptime";
              keyColor = "white";
            }
            {
              type = "custom";
              format = "└──────────────────────────────────────────────┘";
            }
            # {
            #   type = "colors";
            #   symbol = "block";
            #   paddingLeft = 12;
            # }
            # {
            #   type = "custom";
            #   format = "            \u001b[30m  \u001b[31m  \u001b[32m  \u001b[33m  \u001b[34m  \u001b[35m  \u001b[36m  \u001b[37m  ";
            # }
          ];
        };
      };
    };
  };
}
