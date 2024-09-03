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

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  users.users.zspekt = {
    shell = pkgs.zsh;
  };

  users.defaultUserShell = pkgs.zsh;

  environment.systemPackages = with pkgs; [

    # editor
    unstable.neovim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    vim

    # git
    gh
    git
    lazygit

    # cli utilities
    calc
    tldr
    zoxide
    pass-wayland
    wget
    curl
    tmux
    tmuxinator
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
    lsof

    # disk utils
    gptfdisk

    # bloat
    neofetch
    cmatrix

    # killing
    killall

    # msging
    tg

    # misc
    qmk # corne
    ydotool
  ];
}
