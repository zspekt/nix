{ pkgs, ... }: # gracias contre
{
  # Enable common container config files in /etc/containers
  virtualisation = {
    oci-containers.backend = "podman";
    podman = {
      enable = true;
      autoPrune = {
        enable = true;
        flags = [ "-af" ];
      };

      # Create a `docker` alias for podman, to use it as a drop-in replacement
      # dockerCompat = true;

      # podman.extraPackages = [ pkgs.zfs ];

      # Required for containers under podman-compose to be able to talk to each other.
      defaultNetwork.settings.dns_enabled = true;
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

  # Useful otherdevelopment tools
  environment.systemPackages = with pkgs; [
    dive # look into docker image layers
    podman-tui # status of containers in the terminal
    # docker-compose # start group of containers for dev
    podman-compose # start group of containers for dev
    unstable.podman
  ];
}
