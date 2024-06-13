{ pkgs, ... }:
{

  programs.gpg = {
    enable = true;
    publicKeys = [
      {
        # source defines the path within the nix store
        # with the current file as a starting point
        # hence why we need to go up 2 dirs
        source = ../../dotfiles/key.pub;
        trust = 5;
      }
    ];
  };

  services.gpg-agent = {
    enable = true;
    sshKeys = [ "9743F1638040D041334B86C5725C37AEBD625B44" ];
    enableSshSupport = true;
    enableZshIntegration = true;
    enableExtraSocket = true;
    defaultCacheTtl = 1300;
    grabKeyboardAndMouse = true;
    pinentryPackage = pkgs.pinentry-qt;
    enableScDaemon = true;
  };
}
