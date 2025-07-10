{
  config,
  pkgs,
  lib,
  ...
}: let
  cfg = config.custom.programs.nvim;
in {
  options.custom.programs.nvim.enable = lib.mkEnableOption {};
  # TODO: Port nvim config to Nixvim (or nvf)
  config = lib.mkIf cfg.enable {
    hm.home.shellAliases = {
      v = "nvim";
      vv = "NVIM_APPNAME=nvim.test nvim";
    };

    hm.xdg.mimeApps.defaultApplications = {
      "text/markdown" = "nvim.desktop";
      "text/plain" = "nvim.desktop";
    };

    environment.systemPackages = with pkgs; [
      angular-language-server
      bash-language-server
      clang-tools
      gcc
      gnumake
      rustc
      cargo
      rust-analyzer
      lua-language-server
      markdownlint-cli2
      marksman
      nil
      nixd
      neovim
      shfmt
      stylua
      typescript-language-server
      unzip
    ];
  };
}
