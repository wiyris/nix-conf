{
  disko.devices = {
    disk = {
      hdd = {
        type = "disk";
        device = "/dev/sdb";
        content = {
          type = "gpt";
          partitions = {
            root = {
              size = "100%";
              content = {
                type = "luks";
                name = "crypted-hdd";
                content = {
                  type = "filesystem";
                  format = "ext4";
                  mountpoint = "/mnt/hdd";
                };
              };
            };
          };
        };
      };
    };
  };
}
