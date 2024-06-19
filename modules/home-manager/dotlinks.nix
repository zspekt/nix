let
  host = builtins.getEnv "HOST";
in
{

  # source defines the path within the nix store
  # from the perspective of the file.
  # whereas target defines the path within home where we want the links

  home.file = {
    neovim = {
      recursive = true;
      source = ../../dotfiles/.config/nvim;
      target = "./.config/nvim";
    };

    zshPluginList = {
      recursive = false;
      source = ../../dotfiles/.zsh/zsh_plugins.txt;
      target = "./.zsh/zsh_plugins.txt";
    };

    zshrc = {
      recursive = false;
      source = ../../dotfiles/.zshrc;
      target = "./.zshrc";
    };

    p10k = {
      recursive = false;
      source = ../../dotfiles/.p10k.zsh;
      target = "./.p10k.zsh";
    };

    hypr = {
      recursive = true;
      source = ../../dotfiles/.config/hypr;
      target = ".config/hypr";
    };

    tmux = {
      recursive = false;
      source = ../../dotfiles/.config/tmux/tmux.conf;
      target = ".config/tmux/tmux.conf";
    };

    waybar = {
      recursive = true;
      source = ../../dotfiles/.config/waybar;
      target = ".config/waybar";
    };

    kitty = {
      recursive = true;
      source = ../../dotfiles/.config/kitty;
      target = ".config/kitty";
    };

    rofi =
      if "${host}" == "nixos" then
        {
          recursive = true;
          source = ../../dotfiles/.config/rofi;
          target = ".config/BOOBA";
        }
      else
        {
          recursive = true;
          source = ../../dotfiles/.config/rofi;
          target = ".config/rofi";
        };
    # rofi = {
    #   recursive = true;
    #   source = ../../dotfiles/.config/rofi;
    #   target = ".config/rofi";
    # };
  };
}
