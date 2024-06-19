{ pkgs, ... }:
{

  programs = {
    zsh.enable = true;
    nano.enable = false;
    neovim.defaultEditor = true;
  };

  users.users.zspekt = {
    shell = pkgs.zsh;
  };

  users.defaultUserShell = pkgs.zsh;

  environment.systemPackages = with pkgs; [

    # editor
    neovim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    vim

    # cli utilities
    fzf
    ripgrep
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
    btop
    htop
    unzip
    # bloat
    neofetch
    cmatrix
  ];
}
