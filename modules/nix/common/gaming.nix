{ config, pkgs, ... }:
{

  # Environment Packages
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.nvidia.acceptLicense = true;
  programs.nix-ld.enable = true;

  # xdg.portal.wlr.enable = true;
  services.dbus.enable = true; # TODO: move this somewhere else. check line above

  # System packages
  environment.systemPackages = with pkgs; [
    wineWowPackages.waylandFull
    lutris
    mangohud
    winetricks
    vulkan-loader
    vulkan-tools
    nv-codec-headers-12
  ];

  programs.coolercontrol = {
    enable = true;
    nvidiaSupport = true;
  };

  programs.gamemode.enable = true;
  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
  };

  hardware = {
    amdgpu.opencl.enable = true; # FIX: do i need this?
    enableRedistributableFirmware = true;

    nvidia = {

      open = false;
      nvidiaSettings = true;
      modesetting.enable = true;
      powerManagement.enable = true;
      powerManagement.finegrained = false;
      package = config.boot.kernelPackages.nvidiaPackages.vulkan_beta;
    };
  };

  services.xserver.displayManager.startx.enable = true; # FIX: do i need this?
  services.xserver.videoDrivers = [ "nvidia" ]; # FIX: do i need this?
  # services.xserver.enable = true; # FIX: do i need this? 

  security.polkit.enable = true;
}
