{
  project.name = "shoko-server";
  services.shoko = {
    service = {
      image = "ghcr.io/shokoanime/server:latest";
      container_name = "shoko_server";
      restart = "always";

      environment = {
        PUID = "1000";
        PGID = "100";
        TZ = "Asia/Tokyo";
      };

      ports = ["8111:8111"];

      dns = [
        "1.1.1.1"
        "1.0.0.1"
      ];

      volumes = [
        "/home/tsubaki/.config/shoko:/home/shoko/.shoko"
        "/mnt/hdd/anime:/mnt/anime"
      ];
    };
  };
}
