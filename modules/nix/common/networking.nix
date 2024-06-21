{ hostname, ... }:
{
  networking = {
    hostName = "${hostname}";
    networkmanager = {
      enable = true; # Easiest to use and most distros use this by default.
      wifi.backend = "iwd";
      dhcp = "dhcpcd";
    };

    # useDHCP = true;
    # wireless.iwd.enable = true;
  };
}
