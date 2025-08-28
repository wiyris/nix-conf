{inputs, ...}: {
  hm = {
    imports = [
      # inputs.nixvim.nixosModules.nixvim
      inputs.nixvim.homeModules.nixvim
      ./plugins
      ./binds.nix
      ./options.nix
    ];

    stylix.targets.nixvim = {
      enable = false;
      plugin = "base16-nvim";
    };

    programs.nixvim.enable = true;
  };
}
