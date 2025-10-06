{
  config,
  lib,
  ...
}: let
  cfg = config.programs'.ollama;
in {
  options.programs'.ollama.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    services.ollama = {
      enable = true;
      acceleration = "rocm";
      rocmOverrideGfx = "10.3.0";
    };
    services.open-webui = {
      enable = true;
      openFirewall = true;
      # environment = {WEBUI_AUTH = "False";};
    };
    systemd.services = {
      ollama.wantedBy = [];
    };
  };
}
