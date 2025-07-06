{pkgs, ...}: {
  environment.systemPackages = with pkgs.yaziPlugins; [
    yatline
  ];
}
