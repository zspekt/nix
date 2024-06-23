{ hostname, ... }:
{
  systemd.network.enable = true;
  networking = {
    hostName = "${hostname}";
    wireless.iwd.enable = true;
    useDHCP = true;
    useNetworkd = true;
    networkmanager.enable = false;
  };
}
