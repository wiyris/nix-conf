{
  lib,
  pkgs,
  config,
  ...
}: let
  cfg = config.custom.services.hiki-mounts;
in {
  options.custom.services.hiki-mounts.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    hm = {
      home.packages = [pkgs.rclone];
      xdg.configFile."rclone/rclone.conf".text = ''
        [hiki]
        type = sftp
        host = 192.168.0.42
        user = tsubaki
        key_file = /home/tsubaki/.ssh/id_ed25519
      '';

      systemd.user.services.hiki-mounts = {
        Unit = {
          Description = "home-lab mount via sftp configuration with nix and home-manager.";
          After = ["network-online.target"];
        };
        Service = {
          Type = "notify";
          ExecStartPre = "/usr/bin/env mkdir -p %h/stuff";
          ExecStart = "${pkgs.rclone}/bin/rclone --config=%h/.config/rclone/rclone.conf --vfs-cache-mode writes --ignore-checksum mount \"hiki:/mnt/hdd/stuff\" \"stuff\"";
          ExecStop = "/bin/fusermount -u %h/stuff";
        };
        Install.WantedBy = [];
      };
    };
  };
}
