{
  input,
  pkgs,
  ...
}: {
  hm'home.packages = [input.quickshell.packages.${pkgs.system}.default];
}
