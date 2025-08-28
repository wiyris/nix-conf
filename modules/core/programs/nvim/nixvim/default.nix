{
  stylix.targets.nixvim = {
    enable = true;
    plugin = "base16-nvim";
  };

  programs.nixvim = {
    enable = true;
  };

  imports = [
    ./plugins
    ./binds.nix
    ./options.nix
  ];
}
