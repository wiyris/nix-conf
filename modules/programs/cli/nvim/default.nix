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
    environment.systemPackages = with pkgs; [
      gcc
      gnumake
      markdownlint-cli2
      stylua
      unzip
      lua-language-server
      bash-language-server
      shfmt
    ];
  };
}
