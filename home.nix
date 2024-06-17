{ ... }:

{
  home = {

    username = "zspekt";
    homeDirectory = "/home/zspekt";
    stateVersion = "23.11";
  };

  imports = [
    ./modules/home-manager/git.nix
    ./modules/home-manager/gpg.nix
    ./modules/home-manager/dotlinks.nix
    ./modules/home-manager/gtk.nix
  ];
}
