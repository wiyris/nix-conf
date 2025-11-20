{
  config,
  inputs,
  lib,
  ...
}: let
  cfg = config.programs'.nixvim;
in {
  options.programs'.nixvim.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    hm' = {
      imports =
        lib.filesystem.listFilesRecursive ./plugins
        ++ [
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
          nui.enable = true;
          lz-n.enable = true; # lazy loading
          lualine.enable = true;
        };
      };
    };
  };
}
