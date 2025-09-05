{config, ...}: {
  services.openssh = {
    enable = true;
    # ports = [];
    settings = {
      # PasswordAuthentication = false;
      # KbdInteractiveAuthentication = false;
      # PermitRootLogin = "no";
      AllowUsers = [];
    };
  };
  boot.initrd.network = {
    enable = true;
    ssh = {
      enable = true;
      hostKeys = ["/etc/ssh/initrd_ssh_host_ed25519_key"];
      authorizedKeys = config.users.users.root.openssh.authorizedKeys.keys;
    };
  };
}
