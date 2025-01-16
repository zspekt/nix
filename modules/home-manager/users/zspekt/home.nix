{ hostname, ... }:

{
  home = {

    username = "zspekt";
    homeDirectory = "/home/zspekt";
    stateVersion = "23.11";
  };

  imports =

    [
      ./git.nix
      ./gpg.nix
      ./dotlinks.nix
    ]

    ++

      (
        if "${hostname}" == "nixos" || "${hostname}" == "nixth" then
          [
            ./gtk.nix
            ./lock.nix
            ./obs.nix
            ./firefox.nix
          ]
        else if "${hostname}" == "nixpi" then
          [ ]
        else
          throw "unknown host"
      );
}
