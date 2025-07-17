{pkgs, ...}: let
  hyprland-scratchpad =
    pkgs.writeScriptBin "hyprland-scratchpad"
    (builtins.readFile ../scripts/hyprland-scratchpad.sh);
  ghostty-scratch = pkgs.writeShellScriptBin "ghostty-scratch" ''
    #!/usr/bin/env bash
    ghostty --class="ghostty.scratch" --background-opacity="0.75" -e fish
  '';
  kitty-scratch = pkgs.writeShellScriptBin "kitty-scratch" ''
    #!/usr/bin/env bash
    kitty --class kitty-scratch --override background_opacity=0.8
  '';
  foot-scratch = pkgs.writeShellScriptBin "foot-scratch" ''
    #!/usr/bin/env bash
    foot --app-id foot-scratch
  '';
  rmpc-ghosttyscratch = pkgs.writeShellScriptBin "rmpc-ghosttyscratch" ''
    #!/usr/bin/env bash
    ghostty --class="rmpc.ghosttyscratch" --background-opacity="0.2" -e rmpc
  '';
  rmpc-kittyscratch = pkgs.writeShellScriptBin "rmpc-kittyscratch" ''
    #!/usr/bin/env bash
    kitty --class rmpc-kittyscratch --override background_opacity=0.2 -e rmpc
  '';
  btop-ghosttyscratch = pkgs.writeShellScriptBin "btop-ghosttyscratch" ''
    #!/usr/bin/env bash
    ghostty --class="btop.ghosttyscratch" --background-opacity="0.2" -e btop
  '';
  btop-kittyscratch = pkgs.writeShellScriptBin "btop-kittyscratch" ''
    #!/usr/bin/env bash
    kitty --class btop-kittyscratch --override background_opacity=0.2 -e btop
  '';
in {
  home.packages = [
    hyprland-scratchpad
    ghostty-scratch
    kitty-scratch
    foot-scratch
    rmpc-ghosttyscratch
    rmpc-kittyscratch
    btop-ghosttyscratch
    btop-kittyscratch
  ];
  wayland.windowManager.hyprland.settings = {
    bind = [
      "$mainMod, N, exec, hyprland-scratchpad --raise-or-run-uwsm kitty-scratch 'kitty --class kitty-scratch --override background_opacity=0.8'"
      "$mainMod, S, exec, hyprland-scratchpad --raise-or-run-uwsm chrome-kagi.com__assistant-Default kagi-scratchpad"
      "$mainMod, M, exec, hyprland-scratchpad --raise-or-run-uwsm chrome-translate.kagi.com__-Default kagi-translate-scratchpad"
      "$mainMod, K, exec, hyprland-scratchpad --raise-or-run-uwsm com/xiaoyifang/goldendict-ng.https://github. goldendict"
      "$mainMod, G, exec, hyprland-scratchpad --raise-or-run-uwsm rmpc-kittyscratch rmpc-kittyscratch"
      "$mainMod, SLASH, exec, hyprland-scratchpad --raise-or-run-uwsm btop-kittyscratch btop-kittyscratch"
    ];
    windowrulev2 = [
      "tag +float_md, class:kitty-scratch"
      "tag +float_md, class:foot-scratch"
      "tag +float_md, class:ghostty.scratch"
      "tag +float_md, class:rmpc.ghosttyscratch"
      "tag +float_md, class:btop.ghosttyscratch"
      "tag +float_md, class:rmpc-kittyscratch"
      "tag +float_md, class:btop-kittyscratch"
      "tag +float_side, class:chrome-kagi.com__assistant-Default"
      "tag +float_side, class:chrome-translate.kagi.com__-Default"
      "tag +float_side, class:com/xiaoyifang/goldendict-ng.https://github."

      "float, tag:float_md"
      "size 70% 70%, tag:float_md"
      "bordersize 1, tag:float_md"
      "float, tag:float_side"
      "move 100%-w-15, tag:float_side"
      "size 30% 93%, tag:float_side"
      "animation slide right, tag:float_side"
      "bordersize 1, tag:float_side"
    ];
  };
}
