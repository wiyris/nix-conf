{pkgs, ...}: {
  programs.dwl = {
    enable = true;
    package = (pkgs.dwl.override {configH = ./dots/config.def.h;}).overrideAttrs (oldAttrs: {
      buildInputs =
        oldAttrs.buildInputs or []
        ++ [
          pkgs.libdrm
          pkgs.fcft
        ];
      patches =
        oldAttrs.patches or []
        ++ [./patches/bar-0.7.patch];
    });
  };
  xdg.portal.config.dwl.default = ["wlr" "gtk"];
}
