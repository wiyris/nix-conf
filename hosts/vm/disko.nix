{inputs, ...}: {
  imports = [inputs.disko.nixosModules.disko];
  disko.devices = {
    disk = {
      main = {
        type = "gpt";
        device = "/dev/sda";
        content = {
          type = "gpt";
          partitions = {
            MBR = {
              type = "EF02"; # for gub MBR
              size = "1M";
              priority = 1; # Needs to be first partition
            };
            ESP = {
              size = "500M";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = ["umask=0077"];
              };
            };
            swap = {
              size = "1G";
              content = {
                type = "swap";
              };
            };
            root = {
              size = "100%";
              content = {
                content = {
                  type = "filesystem";
                  format = "ext4";
                  mountpoint = "/";
                };
              };
            };
          };
        };
      };
    };
  };
}
