{
  lib,
  pkgs,
  ...
}: let
  indent = {
    tab-width = 2;
    unit = "  ";
  };
in {
  programs.helix.languages = {
    language = [
      {
        name = "bash";
        auto-format = true;
        formatter = {
          command = "${pkgs.shfmt}/bin/shfmt";
          args = ["-i" "2"];
        };
        inherit indent;
      }
      {
        name = "yaml";
        auto-format = true;
        formatter = {
          command = "${pkgs.nodePackages.prettier}/bin/prettier";
          args = ["--parser" "yaml"];
        };
        language-servers = ["yaml-language-server"];
        inherit indent;
      }
      {
        name = "markdown";
        auto-format = true;
        formatter = {
          command = "${pkgs.nodePackages.prettier}/bin/prettier";
          args = ["--parser" "markdown"];
        };
        language-servers = ["marksman"];
        inherit indent;
      }
      {
        name = "lua";
        auto-format = true;
        formatter = {
          command = "${pkgs.stylua}/bin/stylua";
          args = ["-"];
        };
        language-servers = ["lua-language-server"];
        inherit indent;
      }
      {
        name = "nu";
        auto-format = true;
        formatter = {
          command = "${pkgs.nushell}/bin/nu";
          args = ["--format"];
        };
      }
      {
        name = "nix";
        auto-format = true;
        formatter = {
          command = "${pkgs.alejandra}/bin/alejandra";
          args = ["-q"];
        };
        language-servers = ["nil"];
        inherit indent;
      }
    ];

    language-server = {
      nil = {
        command = lib.getExe pkgs.nil;
        config.nil.formatting.command = ["${lib.getExe pkgs.alejandra}" "-q"];
      };

      lua-language-server = {
        command = "${pkgs.lua-language-server}/bin/lua-language-server";
        config = {
          runtime = {
            version = "LuaJIT";
            path = [
              "?.lua"
              "?/init.lua"
            ];
          };
          diagnostics = {
            globals = ["vim"]; # Useful if you're working with Neovim config
          };
          workspace = {
            library = {};
            maxPreload = 2000;
            preloadFileSize = 1000;
            checkThirdParty = false;
          };
          telemetry = {
            enable = false;
          };
          format = {
            enable = true;
            defaultConfig = {
              indent_style = "space";
              indent_size = "2";
            };
          };
        };
      };

      yaml-language-server = {
        command = "${pkgs.yaml-language-server}/bin/yaml-language-server";
        args = ["--stdio"];
      };

      marksman = {
        command = "${pkgs.marksman}/bin/marksman";
      };
    };
  };
}
