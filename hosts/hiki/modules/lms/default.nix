{pkgs, ...}: {
  environment.systemPackages = [pkgs.lms];
  environment.etc."lms.conf".text = ''
  '';
  systemd.services.my-custom-service = {
    description = "Lightweight Music Server - Access your self-hosted music using a web interface";
    after = ["network.target"];
    wantedBy = ["multi-user.target"];

    serviceConfig = {
      Type = "simple";
      User = "lms";
      ExecStart = "lms";
      Restart = "always";
      RestartSec = 30;
    };
  };
}
