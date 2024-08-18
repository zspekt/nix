{ hostname, pkgs, ... }:
{
  systemd.network.enable = true;
  networking = {
    hostName = "${hostname}";
    wireless.iwd.enable = true;
    useDHCP = true;
    useNetworkd = true;
    networkmanager.enable = false;
    hosts = {
      # "192.168.49.2" = [
      #   "synchat.internal"
      #   "synchatapi.internal"
      # ];
      #
      "192.168.1.244" = [ "nixth.lan" ];
      "192.168.1.128" = [ "nixpi.lan" ];
    };
  };

  environment.systemPackages = with pkgs; [
    wireguard-tools
    traceroute
  ];

  users.users.zspekt = {
    extraGroups = [ "networkmanager" ];
  };
}
