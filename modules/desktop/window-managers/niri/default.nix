{inputs, ...}: {
  hm = {
    imports = [inputs.niri.homeModules.niri];
    programs.niri = {
      enable = true;
    };
  };
}
