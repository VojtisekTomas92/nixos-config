{ config, ... }: {
  # TODO Check out silverbullet
  services.podman = {
    enable = true;

    networks = {
      yamtrack-net = {
        description = "Internal Network for Yamtrack and Redis";
      };
    };

    volumes = {
      redis_data = {
        description = "Persistent data volume for Redis";
      };
      yamtrack_db = {
        description = "Persistent data volume for Yamtrack Database";
      };

    };

    containers = {
      yamtrack-redis = {
        image = "docker.io/library/redis:8-alpine";
        network = [ "yamtrack-net" ];
        networkAlias = [ "redis" ];
        volumes = [
          "redis_data:/data"
        ];

      };

      yamtrack = {
        image = "ghcr.io/fuzzygrim/yamtrack";
        network = [ "yamtrack-net" ];
        ports = [
          "127.0.0.1:8000:8000"
        ];
        environment = {
          TZ = "Europe/Berlin";
          # TODO Replace this
          SECRET = "hfnfhjghstjmm56w7i64uqitashjndfasgh654";
          REDIS_URL = "redis://redis:6379";
        };
        volumes = [
          "yamtrack_db:/yamtrack/db"
        ];
      };
    };
  };

}
