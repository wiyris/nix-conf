{
  lib,
  pkgs,
  config,
  ...
}: let
  cfg = config.services'.hiki-mounts;
  inherit (config.globals) homeDirectory;
in {
  options.services'.hiki-mounts.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    hm'= {
      home.packages = [pkgs.rclone];
      home.shellAliases = {
        hmt = "systemctl start --user hiki-mounts.service";
        humt = "systemctl stop --user hiki-mounts.service";
      };
      xdg.configFile."rclone/rclone.conf".text = ''
        [hiki]
        type = sftp
        host = 192.168.0.42
        user = tsubaki
        key_file = ${homeDirectory}/.ssh/id_ed25519
      '';

      systemd.user.services.hiki-mounts = {
        Unit = {
          Description = "home-lab mount via sftp configuration with nix and home-manager.";
          After = ["network-online.target"];
        };
        Service = {
          Type = "notify";
          # ExecStartPre = "/usr/bin/env mkdir -p /mnt/hiki";
          ExecStart = "${pkgs.rclone}/bin/rclone --config=%h/.config/rclone/rclone.conf --vfs-cache-mode writes --ignore-checksum mount \"hiki:\" \"/mnt/hiki\"";
          ExecStop = "/bin/fusermount -u /mnt/hiki";
        };
        Install.WantedBy = [];
      };
    };
  };
}
