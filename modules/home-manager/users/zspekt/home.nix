{ ... }:

{
  home = {

    username = "zspekt";
    homeDirectory = "/home/zspekt";
    stateVersion = "23.11";
  };

  imports = [
    ./git.nix
    ./gpg.nix
    ./dotlinks.nix
    ./gtk.nix
  ];
}
