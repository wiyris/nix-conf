{
  lib,
  pkgs,
  config,
  ...
}: let
  cfg = config.custom.programs.nvim;
in {
  options.custom.programs.nvim.enable = lib.mkEnableOption {};
  # TODO: Port nvim config to Nixvim (or nvf)
  config = lib.mkIf cfg.enable {
    hm'.home.shellAliases = {
      v = "NVIM_APPNAME=lvim nvim";
      vv = "NVIM_APPNAME=lvim nvim";
      lv = "NVIM_APPNAME=lazyvim nvim";
    };

    hm'.xdg.mimeApps.defaultApplications = {
      "text/markdown" = "nvim.desktop";
      "text/plain" = "nvim.desktop";
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
      shfmt
      statix
      stylua
      tree-sitter
      # tree-sitter-grammars
      typescript-language-server
      unzip

      vimPlugins.nvim-lspconfig
    ];
  };
}
