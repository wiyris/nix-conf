{
  config,
  lib,
  pkgs,
  osConfig,
  ...
}:
let
  opacity =
    if config.wayland.windowManager.hyprland.settings.decoration.blur.enabled then "0.0" else "1.0";

  inherit (osConfig.globals) defaultShell;
  hyprland-scratchpad = pkgs.writeScriptBin "hyprland-scratchpad" (
    builtins.readFile ../scripts/hyprland-scratchpad.sh
  );
in
{
  home.packages = [ hyprland-scratchpad ];
  wayland.windowManager.hyprland.settings = {
    bind = [
      "$mod, X, exec, hyprland-scratchpad --toggle"
      "$mod, L, exec, hyprland-scratchpad --raise-or-run-uwsm io.github.xiaoyifang.goldendict_ng goldendict"
    ]
    ++ lib.optionals osConfig.programs'.foot.isDefault [
      "$mod, F, exec, hyprland-scratchpad --raise-or-run-uwsm foot-scratch 'footclient --app-id foot-scratch'"
    ]
    ++ lib.optionals osConfig.programs'.ghostty.isDefault [
      "$mod, F, exec, hyprland-scratchpad --raise-or-run-uwsm ghostty.scratch 'ghostty --class=ghostty.scratch --background-opacity=${opacity} -e ${defaultShell}'"
    ]
    ++ lib.optionals osConfig.programs'.kitty.isDefault [
      "$mod, F, exec, hyprland-scratchpad --raise-or-run-uwsm kitty-scratch 'kitty --class kitty-scratch --override background_opacity=${opacity}'"
    ];

    windowrule = [
      "tag +float_md, match:class kitty-scratch"
      "tag +float_md, match:class foot-scratch"
      "tag +float_md, match:class ghostty.scratch"
      "tag +float_side, match:class io.github.xiaoyifang.goldendict_ng"
      "stay_focused on, match:class io.github.xiaoyifang.goldendict_ng"
      "no_anim on, match:class foot-scratch"
      "no_anim on, match:class io.github.xiaoyifang.goldendict_ng"
    ];
  };
}
