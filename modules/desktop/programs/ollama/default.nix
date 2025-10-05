{
  config,
  lib,
  ...
}: let
  cfg = config.programs'.ollama;
in {
  options.programs'.ollama.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    hm'.services.ollama = {
      enable = true;
      acceleration = "rocm";
    };
  };
}
