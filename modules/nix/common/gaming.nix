{ pkgs, ... }:
{
  # xdg.portal.wlr.enable = true;
  services.dbus.enable = true; # TODO: move this somewhere else. check line above

  # System packages
  environment.systemPackages = with pkgs; [
    lutris
    mangohud
    # winetricks
    # vulkan-loader
    # vulkan-tools
    # nv-codec-headers-12
    protonup
    r2modman
  ];

  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "/home/zspekt/.steam/root/compatiblitytools.d";
  };

  fileSystems."/home/zspekt/games" = {
    device = "/dev/disk/by-uuid/d850f08d-8bea-4129-8e84-d6ffddea6b61";
    fsType = "ext4";
  };

  programs.gamemode.enable = true;
  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
  };
}
