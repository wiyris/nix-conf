{pkgs, ...}: {
  environment.systemPackages = [pkgs.lms];
  users.users.lms.isSystemUser = true;
  systemd.services.lms = {
    description = "";
    after = ["network-online.target"];
    wantedBy = ["multi-user.target"];
  };
  serviceConfig = {
    Type = "simple";
    User = "lms";
    ExecStart = "${pkgs.lms}/bin/lms";
  };
}
