{
  inputs,
  unstable,
  pkgs,
  system,
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
    eza # better ls
    calc
    tldr
    zoxide
    (pass-wayland.withExtensions (exts: [ exts.pass-otp ]))
    zbar # for qr codes
    wget
    curl
    coreutils
    file
    gnumake
    antidote # zsh plugin manager
    bat # better cat
    unzip

    jq
    yq # like jq but for yaml, json, and xml
    jqp

    # tmux
    inputs.tmux-latest.defaultPackage.${system} # master
    inputs.sesh-latest.defaultPackage.${system} # master
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
