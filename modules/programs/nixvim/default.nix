{
  config,
  inputs,
  lib,
  ...
}:
let
  cfg = config.programs'.nixvim;
in
{
  options.programs'.nixvim.enable = lib.mkEnableOption { };
  config = lib.mkIf cfg.enable {
    hm' = {
      imports = lib.filesystem.listFilesRecursive ./plugins ++ [
        inputs.nixvim.homeModules.nixvim
        ./binds.nix
        ./options.nix
      ];

      stylix.targets.nixvim = {
        enable = false;
        plugin = "base16-nvim";
      };

      programs.nixvim = {
        enable = true;
        plugins = {
          colorschemes.catppuccin.enable = true;
          lualine.enable = true;
          mini-ai.enable = true;
          mini-pairs.enable = true;
          mini-icons.enable = true;
        };
      };
    };
  };
}
