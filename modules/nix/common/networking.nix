{ hostname, pkgs, ... }:
{
  systemd.network.enable = true;
  networking = {
    hostName = "${hostname}";
    wireless.iwd.enable = true;
    useDHCP = true;
    useNetworkd = true;
    networkmanager.enable = false;

    firewall = {
      enable = true;

      allowPing = true;
      allowedTCPPorts = [
        56812 # openwrt logs
        63879 # qbittorrent
      ];
    };
  };

  environment.systemPackages = with pkgs; [
    wireguard-tools
    traceroute
    netcat
    nmap
    iptables
  ];

  users.users.zspekt = {
    extraGroups = [ "networkmanager" ];
  };
}
