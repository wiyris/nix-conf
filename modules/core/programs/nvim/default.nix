{
  lib,
  pkgs,
  config,
  ...
}: let
  cfg = config.custom.programs.nvim;
in {
  options.custom.programs.nvim.enable = lib.mkEnableOption {};
  # imports = [./nixvim];
  # TODO: Port nvim config to Nixvim (or nvf)
  config = lib.mkIf cfg.enable {
    hm.home.shellAliases = {
      # v = "nvim";
      v = "NVIM_APPNAME=nvim-lazy nvim";
      vv = "NVIM_APPNAME=lazyvim nvim";
    };

    hm.xdg.mimeApps.defaultApplications = {
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
      stylua
      tree-sitter
      # tree-sitter-grammars
      typescript-language-server
      unzip

      vimPlugins.nvim-lspconfig
    ];
  };
}
