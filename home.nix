{ pkgs, ... }:
{
  home = {

    username = "zspekt";
    homeDirectory = "/home/zspekt";
    stateVersion = "23.11";
  };

  programs.git = {
    enable = true;
    userName = "zspekt";
    userEmail = "zspekt@tutanota.com";
    signing = {
      key = "3E78FE6492EBD2DE";
      signByDefault = true;
    };
  };

  programs.gpg = {
    enable = true;
    publicKeys = [
      {
        source = ./dotfiles/key.pub;
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

  # 	programs.zsh = {
  # 		enable = true;
  # 		syntaxHighlighting.enable = true;
  # 		shellAliases = {
  # 			mynixxa = "neofetch";
  # 		};
  #
  #     # antidote
  #     antidote = {
  #       enable = true;
  #
  #       plugins = [
  #
  #         "romkatv/zsh-defer"
  #         "ohmyzsh/ohmyzsh path:lib"
  #         "ohmyzsh/ohmyzsh path:plugins/colored-man-pages"
  #         "ohmyzsh/ohmyzsh path:plugins/git kind:defer"
  # #ohmyzsh/ohmyzsh path:plugins/git-extras kind:defer"
  # #ohmyzsh/ohmyzsh path:plugins/git-prompt kind:defer"
  #         "ohmyzsh/ohmyzsh path:plugins/golang"
  #         "ohmyzsh/ohmyzsh path:plugins/python kind:defer"
  #         "ohmyzsh/ohmyzsh path:plugins/gh kind:defer"
  #         "ohmyzsh/ohmyzsh path:plugins/alias-finder"
  # # ohmyzsh/ohmyzsh path:plugins/podman"
  #         "ohmyzsh/ohmyzsh path:plugins/docker"
  #         "ohmyzsh/ohmyzsh path:plugins/docker-compose"
  #         "ohmyzsh/ohmyzsh path:plugins/docker-machine"
  #         "zsh-users/zsh-completions"
  #         "ohmyzsh/ohmyzsh path:plugins/fzf"
  # # ohmyzsh/ohmyzsh path:plugins/zsh-interactive-cd"
  #         "romkatv/powerlevel10k"
  # # suggests pkg to install if command not found
  #         "ohmyzsh/ohmyzsh path:plugins/command-not-found"
  #         "zsh-users/zsh-autosuggestions kind:defer"
  #         "zsh-users/zsh-syntax-highlighting kind:defer"
  #         "zsh-users/zsh-history-substring-search kind:defer"
  #       ];
  #     };
  # 	};

  home.file = {
    neovim = {
      recursive = true;
      source = ./dotfiles/.config/nvim;
      target = "./.config/nvim";
    };

    zshPluginList = {
      recursive = false;
      source = ./dotfiles/.zsh/zsh_plugins.txt;
      target = "./.zsh/zsh_plugins.txt";
    };

    zshrc = {
      recursive = false;
      source = ./dotfiles/.zshrc;
      target = "./.zshrc";
    };

    p10k = {
      recursive = false;
      source = ./dotfiles/.p10k.zsh;
      target = "./.p10k.zsh";
    };

    hypr = {
      recursive = true;
      source = ./dotfiles/.config/hypr;
      target = ".config/hypr";
    };

    tmux = {
      recursive = false;
      source = ./dotfiles/.config/tmux/tmux.conf;
      target = ".config/tmux/tmux.conf";
    };

    waybar = {
      recursive = true;
      source = ./dotfiles/.config/waybar;
      target = ".config/waybar";
    };

    kitty = {
      recursive = true;
      source = ./dotfiles/.config/kitty;
      target = ".config/kitty";
    };

    rofi = {
      recursive = true;
      source = ./dotfiles/.config/rofi;
      target = ".config/rofi";
    };
  };
}
