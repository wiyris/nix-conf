{
  config,
  pkgs,
  lib,
  ...
}: let
  cfg = config.custom.programs.htop;
in {
  options.custom.programs.htop.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    hm.programs.htop = {
      enable = true;
      package = pkgs.htop-vim;

      settings = {
        tree_view = true;
        hide_userland_threads = true;
        highlight_changes = true;
        show_cpu_frequency = true;
        show_cpu_temperature = true;
        highlight_base_name = true;
        show_program_path = false;
      };
    };
  };
}
