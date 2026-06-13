{ pkgs, ... }:
{
  networking.firewall = {
    allowedUDPPorts = [
      22000
      21027
    ];
    allowedTCPPorts = [
      22000
      42355
    ];
  };

  environment.systemPackages = with pkgs; [ syncthing ];

  services = {
    syncthing = {
      enable = true;
      user = "zspekt";
      configDir = "/home/zspekt/.config/syncthing";
      overrideDevices = false; # overrides any devices added or deleted through the WebUI
      overrideFolders = false; # overrides any folders added or deleted through the WebUI
      settings = {
        options = {
          relaysEnabled = false;
          localAnnounceEnabled = true;
        };
        gui = {
          insecureSkipHostcheck = true;
          insecureAdminAccess = true;
        };
        devices = { };
        # folders = {
        # "Example" = {
        #   path = "/home/myusername/Example";
        #   devices = [ "device1" ];
        #   ignorePerms = false; # By default, Syncthing doesn't sync file permissions. This line enables it for this folder.
        # };
        # };
      };
    };
  };
}
