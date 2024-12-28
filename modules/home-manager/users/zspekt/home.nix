{ hostname, ... }:

{
  home = {

    username = "zspekt";
    homeDirectory = "/home/zspekt";
    stateVersion = "23.11";
  };

  imports =

    if "${hostname}" == "nixos" || "${hostname}" == "nixth" then
      [
        ./git.nix
        ./gpg.nix
        ./dotlinks.nix
        ./gtk.nix
        ./lock.nix
        ./obs.nix
        ./firefox.nix
      ]
    else if "${hostname}" == "nixpi" then
      [
        ./git.nix
        ./gpg.nix
        ./dotlinks.nix
      ]
    else
      throw "unknown host";
}
