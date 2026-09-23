{ pkgs, unstable, ... }:
{
  # xdg.portal.wlr.enable = true;
  services.dbus.enable = true; # TODO: move this somewhere else. check line above

  # used to edit g502 x config
  services.ratbagd = {
    enable = true;
  };

  # System packages
  environment.systemPackages = with pkgs; [
    lutris
    mangohud
    # winetricks
    # vulkan-loader
    # vulkan-tools
    # nv-codec-headers-12
    unstable.protonup-ng
    unstable.protonup-qt
    unstable.deadlock-mod-manager
    unstable.piper
    r2modman
  ];

  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "/home/zspekt/.steam/root/compatiblitytools.d";
  };

  fileSystems."/home/zspekt/games" = {
    device = "/dev/disk/by-uuid/d850f08d-8bea-4129-8e84-d6ffddea6b61";
    fsType = "ext4";
  };

  programs.gamemode = {
    enable = true;
    enableRenice = true; # required for the renice setting below to actually take effect

    settings = {
      general = {
        renice = 10;
        inhibit_screensaver = 1;
      };

      gpu = {
        apply_gpu_optimisations = "accept-responsibility";
        gpu_device = 0;
        nv_powermizer_mode = 1; # "Prefer Maximum Performance" instead of adaptive clocking
      };

      cpu = {
        park_cores = "no";
        pin_cores = "no";
      };
    };
  };

  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
  };
}
