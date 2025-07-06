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

    environment.systemPackages = with pkgs; [
      bash-language-server
      clang-tools
      gcc
      gnumake
      lua-language-server
      markdownlint-cli2
      marksman
      nil
      nixd
      nvim
      shfmt
      stylua
      typescript-language-server
      unzip
    ];
  };
}
