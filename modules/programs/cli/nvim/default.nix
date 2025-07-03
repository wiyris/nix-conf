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
    hm.home.shellAliases.vv = "NVIM_APPNAME=nvim.bak nvim";
    hm.home.shellAliases.lv = "NVIM_APPNAME=nvim.lazy nvim";
    environment.systemPackages = with pkgs; [
      gcc
      gnumake
      lua-language-server
      markdownlint-cli2
      stylua
      unzip
      lua-language-server
      bash-language-server
      shfmt
    ];
  };
}
