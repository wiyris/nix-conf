{
  config,
  lib,
  pkgs,
  osConfig,
  ...
}: let
  opacity =
    if config.wayland.windowManager.hyprland.settings.decoration.blur.enabled
    then "0.2"
    else "1.0";

  inherit (osConfig.globals) defaultShell;
  hyprland-scratchpad = pkgs.writeScriptBin "hyprland-scratchpad" (
    builtins.readFile ../scripts/hyprland-scratchpad.sh
  );
in {
  home.packages = [hyprland-scratchpad];
  wayland.windowManager.hyprland.settings = {
    bind =
      [
        # "$mainMod, APOSTROPHE, exec, hyprland-scratchpad --toggle"
        # "$mainMod, G, exec, hyprland-scratchpad --raise-or-run-uwsm chrome-localhost__-Default 'chromium --app=http:localhost:8080'"
        "$mainMod, G, exec, hyprland-scratchpad --raise-or-run-uwsm chrome-kagi.com__assistant-Default 'chromium --app=https://kagi.com/assistant'"
        "$mainMod, W, exec, hyprland-scratchpad --raise-or-run-uwsm chrome-translate.kagi.com__-Default 'chromium --app=https://translate.kagi.com'"
        "$mainMod, L, exec, hyprland-scratchpad --raise-or-run-uwsm com/xiaoyifang/goldendict-ng.https://github. goldendict"
      ]
      ++ lib.optionals osConfig.programs'.foot.isDefault [
        "$mainMod, F, exec, hyprland-scratchpad --raise-or-run-uwsm foot-scratch 'foot --app-id foot-scratch'"
      ]
      ++ lib.optionals osConfig.programs'.ghostty.isDefault [
        "$mainMod, F, exec, hyprland-scratchpad --raise-or-run-uwsm ghostty.scratch 'ghostty --class=ghostty.scratch --background-opacity=${opacity} -e ${defaultShell}'"
      ]
      ++ lib.optionals osConfig.programs'.kitty.isDefault [
        "$mainMod, F, exec, hyprland-scratchpad --raise-or-run-uwsm kitty-scratch 'kitty --class kitty-scratch --override background_opacity=${opacity}'"
      ];

    windowrulev2 = [
      "tag +float_md, class:kitty-scratch"
      "tag +float_md, class:foot-scratch"
      "tag +float_md, class:ghostty.scratch"
      "tag +float_side, class:chrome-localhost__-Default"
      "tag +float_side, class:chrome-kagi.com__assistant-Default"
      "tag +float_side, class:chrome-translate.kagi.com__-Default"
      "tag +float_side, class:com/xiaoyifang/goldendict-ng.https://github."
      "stayfocused, class:com/xiaoyifang/goldendict-ng.https://github."
      "noanim, class:ghostty.scratch"
      "noanim, class:kitty-scratch"
      "noanim, class:chrome-localhost__-Default"
      "noanim, class:chrome-kagi.com__assistant-Default"
      "noanim, class:chrome-translate.kagi.com__-Default"
      "noanim, class:com/xiaoyifang/goldendict-ng.https://github."
      "opacity 0.8 override 0.8 override, class:chrome-localhost__-Default"

      "float, tag:float_md"
      "size 70% 70%, tag:float_md"
      "float, tag:float_side"
      "move 100%-w-15, tag:float_side"
      "size 30% 93%, tag:float_side"
      # "animation slide bottom, tag:float_md"
      # "animation slide right, tag:float_side"
    ];
  };
}
