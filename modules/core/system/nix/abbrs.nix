{
  lib,
  config,
  ...
}: let
  inherit (config.globals) configDirectory;
in {
  hm'.programs.fish.shellAbbrs = lib.mkIf config.programs.fish.enable {
    nf = "nix flake";
    nfc = "nix flake check";
    nfu = "nix flake update";
    npr = "nixpkgs-review pr --run fish --print-result";
    nd = "nix develop --command fish";
    nb = "nix build";
    ns = "nix shell";
    nr = "nix run";
    ncg = "sudo nix-collect-garbage -d && nix-collect-garbage -d";
    nvd = "nvd --color always diff /run/current-system result | rg -v 0.0.0 | less -R";
    # sw = "nh os switch --ask ${configDirectory}";
    sw = "nh os switch";
  };
}
