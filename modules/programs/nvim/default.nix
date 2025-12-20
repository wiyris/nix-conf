{
  lib,
  pkgs,
  config,
  ...
}:
let
  cfg = config.programs'.nvim;
in
{
  options.programs'.nvim.enable = lib.mkEnableOption { };
  # TODO: Port nvim config to Nixvim (or nvf)
  config = lib.mkIf cfg.enable {
    hm'.home.shellAliases = {
      v = "nvim";
      vv = "NVIM_APPNAME=lvim nvim";
    };

    hm'.xdg.mimeApps.defaultApplications =
      let
        nvim = "nvim.desktop";
      in
      {
        "application/xhtml+xml" = [ nvim ];
        "text/csv" = [ nvim ];
        "text/html" = [ nvim ];
        "text/markdown" = [ nvim ];
        "text/plain" = [ nvim ];
        "text/x-c++src" = [ nvim ];
        "text/yaml" = [ nvim ];
      };

    environment.systemPackages = with pkgs; [
      angular-language-server
      bash-language-server
      cargo
      clang-tools
      gcc
      gnumake
      lua-language-server
      markdownlint-cli2
      marksman
      neovim
      nil
      nixd
      rust-analyzer
      rustc
      rustfmt
      shfmt
      statix
      stylua
      tree-sitter
      # tree-sitter-grammars
      # typescript-language-server
      kdePackages.qtdeclarative

      vimPlugins.nvim-lspconfig
    ];
  };
}
