{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    sshs
  ];

  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
    };
  };
}
