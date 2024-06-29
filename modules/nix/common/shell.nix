{ pkgs, unstable, ... }:
{

  programs = {
    zsh.enable = true;
    command-not-found.enable = false;
    nano.enable = false;
    neovim = {
      enable = true;
      defaultEditor = true;
    };
  };

  users.users.zspekt = {
    shell = pkgs.zsh;
  };

  users.defaultUserShell = pkgs.zsh;

  environment.systemPackages = with pkgs; [

    # editor
    unstable.neovim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    vim

    # cli utilities
    tldr
    zoxide
    gh
    git
    pass-wayland
    wget
    curl
    tmux
    coreutils
    antidote
    bat
    unzip

    # finding stuff
    fzf
    ripgrep
    fd

    # monitoring
    btop
    htop

    # bloat
    neofetch
    cmatrix
  ];
}
