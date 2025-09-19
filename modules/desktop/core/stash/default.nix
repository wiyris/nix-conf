{
  inputs,
  pkgs,
  ...
}: let
  stashPkg = inputs.stash.packages.${pkgs.stdenv.hostPlatform.system}.default;
in {
  environment.systemPackages = [stashPkg];

  # Additionally feel free to add the Stash package in `systemd.packages` to
  # automatically run the Stash watch daemon, which will watch your primary
  # clipboard for changes and persist them.
  systemd.packages = [stashPkg];
}
