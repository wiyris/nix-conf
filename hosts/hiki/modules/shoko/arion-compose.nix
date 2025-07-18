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

      network_mode = "host";

      ports = ["8111:8111"];

      # dns = [
      #   "1.1.1.1"
      #   "1.0.0.1"
      #   "194.242.2.2"
      # ];

      volumes = [
        "/home/tsubaki/.config/shoko:/home/shoko/.shoko"
        "/mnt/anime:/mnt/anime"
      ];
    };
  };
}
