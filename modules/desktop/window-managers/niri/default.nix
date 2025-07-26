{
  pkgs,
  inputs,
  config,
  ...
}: let
  inherit (config.globals) homeDirectory;
in {
  programs.uwsm.waylandCompositors.niri = {
    prettyName = "Niri-UWSM";
    comment = "Niri managed by UWSM";
    binPath = "${homeDirectory}/.nix-profile/bin/niri-session";
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
