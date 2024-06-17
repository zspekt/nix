{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ pinentry-gnome3 ];

  # Enable GPG at a system level 
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    enableExtraSocket = true;
  };

  environment.variables = {
    GPG_TTY = "${pkgs.coreutils}/bin/tty";
    SSH_AUTH_SOCK = "/run/user/1000/gnupg/S.gpg-agent.ssh";
  };

  # Enable GPG Smartcards (Like Yubikeys)
  hardware.gpgSmartcards.enable = true;

  services.pcscd.enable = true;
  services.dbus.packages = [ pkgs.gcr ];
}
