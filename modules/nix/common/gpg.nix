{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    pinentry-gnome3
    yubikey-manager
    yubico-piv-tool
    yubikey-touch-detector # one of these is redundant
  ];

  # Enable GPG at a system level
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    enableExtraSocket = true;
  };

  # Enable GPG Smartcards (Like Yubikeys)
  hardware.gpgSmartcards.enable = true;

  programs.yubikey-touch-detector.enable = true; # one of these is redundant

  services.pcscd.enable = true;
  services.dbus.packages = [ pkgs.gcr ];

  services = {
    mullvad-vpn.enable = true;
  };
}
