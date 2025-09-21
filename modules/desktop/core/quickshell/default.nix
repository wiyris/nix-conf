{
  inputs,
  pkgs,
  ...
}: {
  hm'.home.packages = [inputs.quickshell.packages.${pkgs.system}.default];
}
