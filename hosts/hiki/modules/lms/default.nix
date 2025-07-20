{pkgs, ...}: {
  environment.systemPackages = [pkgs.lms];
  environment.etc."lms.conf".text = ''
  '';

  users.users.lms = {
    isSystemUser = true;
    group = "lms";
    home = "/var/lib/lms";
    createHome = true;
    shell = pkgs.shadow.bins.nologin;
  };

  systemd.services.my-custom-service = {
    description = "Lightweight Music Server - Access your self-hosted music using a web interface";
    after = ["network.target"];
    wantedBy = ["multi-user.target"];

    serviceConfig = {
      Type = "simple";
      User = "lms";
      Group = "lms";
      ExecStart = "${pkgs.lms}/bin/lms";
      WorkingDirectory = "/var/lib/lms";
      Restart = "always";
      RestartSec = 30;
    };
  };
}
