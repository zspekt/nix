{ pkgs, ... }:
{
  users.users.zspekt.extraGroups = [ "docker" ];

  # Enable common container config files in /etc/containers
  virtualisation = {
    oci-containers.backend = "docker";
    docker = {
      enable = true;
      autoPrune = {
        enable = true;
        flags = [ "-af" ];
      };
      rootless = {
        enable = true;
        setSocketVariable = true;
      };

      daemon.settings.data-root = "/home/zspekt/.dockerDaemonRoot/";

      defaltNetwork.settings.dns_enabled = true;
    };

    containers = {
      enable = true;
      # storage.settings = {
      #   storage.driver = "zfs";
      #   storage.graphroot = "/var/lib/containers/storage";
      #   storage.runroot = "/run/containers/storage";
      #   storage.options.zfs.fsname = "zroot/podman";
      # };
      containersConf.settings = {
        containers.dns_servers = [
          "8.8.8.8"
          "8.8.4.4"
        ];
      };
    };
  };

  # Useful other development tools
  environment.systemPackages = with pkgs; [
    dive # look into docker image layers
    lazydocker # tui app for docker and docker-compose
    docker-compose # start group of containers for dev
  ];
}
