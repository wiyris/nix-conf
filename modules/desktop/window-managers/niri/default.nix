{
  pkgs,
  inputs,
  ...
}: {
  programs.uwsm.waylandCompositors.niri = {
    prettyName = "Niri-UWSM";
    comment = "Niri managed by UWSM";
    binPath = "${pkgs.niri}/bin/niri-session";
  };
  hm = {
    imports = [
      inputs.niri.homeModules.niri
      ./dots/binds.nix
      ./dots/general.nix
      ./dots/rules.nix
    ];
    programs.niri.enable = true;
    home.packages = [pkgs.xwayland-satellite];
  };
}
