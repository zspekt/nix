{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ pinentry-gnome3 ];

  # Enable GPG at a system level 
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    enableExtraSocket = true;
  };

  # Enable GPG Smartcards (Like Yubikeys)
  hardware.gpgSmartcards.enable = true;

  services.pcscd.enable = true;
  services.dbus.packages = [ pkgs.gcr ];
}
