{
  inputs,
  unstable,
  pkgs,
  ...
}:
{

  programs = {
    zsh.enable = true;
    command-not-found.enable = false;
    nano.enable = false;
    neovim = {
      enable = true;
      defaultEditor = true;
      package = inputs.neovim-nightly-overlay.packages.${pkgs.system}.default;
    };
  };

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  users.users.zspekt = {
    shell = pkgs.zsh;
  };

  users.defaultUserShell = pkgs.zsh;

  environment.systemPackages = with pkgs; [
    vim # just in case

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
    coreutils
    gnumake
    antidote # zsh plugin manager
    bat # better cat
    unzip

    jq
    yq # like jq but for yaml, json, and xml
    jqp

    # tmux
    inputs.tmux-latest.defaultPackage.x86_64-linux # master
    inputs.sesh-latest.defaultPackage.x86_64-linux # master
    tmuxinator
    thumbs

    # finding stuff
    fzf
    ripgrep
    fd
    gum

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

    yazi

    # misc
    qmk # corne
    ydotool
  ];
}
