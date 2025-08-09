{pkgs, ...}: {
  environment.systemPackages = [pkgs.lms];
  environment.etc."lms.conf".text = ''
  '';

  networking.firewall.allowedTCPPorts = [5082];
  users.groups.lms = {};
  users.users.lms = {
    isSystemUser = true;
    group = "lms";
    home = "/var/lms";
    createHome = true;
  };

  systemd.services.lms = {
    description = "Lightweight Music Server - Access your self-hosted music using a web interface";
    after = ["network.target"];
    wantedBy = ["multi-user.target"];

    serviceConfig = {
      Type = "simple";
      User = "lms";
      Group = "lms";
      ExecStart = "${pkgs.lms}/bin/lms";
      WorkingDirectory = "/var/lms";
      Restart = "always";
      RestartSec = 30;
    };
  };
}
