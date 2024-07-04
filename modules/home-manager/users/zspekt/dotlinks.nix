{ hostname, ... }:
{

  imports =

    if "${hostname}" == "nixos" then
      [
        ./dotlinks/hyprDesktop.nix
        ./dotlinks/waybarDesktop.nix
      ]

    else if "${hostname}" == "nixth" then
      [
        ./dotlinks/hyprThpad.nix
        ./dotlinks/waybarThpad.nix
      ]
    else
      throw "unknown host";

  # source defines the path within the nix store
  # from the perspective of the file.
  # whereas target defines the path within home where we want the links
  # when linking a dir, the whole dir will be read-only — not just its contents

  home.file = {

    neovim = {
      recursive = true;
      source = ../../../../dotfiles/.config/nvim;
      target = "./.config/nvim";
    };

    zshPluginList = {
      recursive = false;
      source = ../../../../dotfiles/.zsh/zsh_plugins.txt;
      target = "./.zsh/zsh_plugins.txt";
    };

    zshrc = {
      recursive = false;
      source = ../../../../dotfiles/.zshrc;
      target = "./.zshrc";
    };

    p10k = {
      recursive = false;
      source = ../../../../dotfiles/.p10k.zsh;
      target = "./.p10k.zsh";
    };

    tmux = {
      recursive = false;
      source = ../../../../dotfiles/.config/tmux/tmux.conf;
      target = ".config/tmux/tmux.conf";
    };

    tmuxTpm = {
      recursive = true;
      source = ../../../../dotfiles/.tmux/plugins/tpm;
      target = ".tmux/plugins/tpm";
    };

    kitty = {
      recursive = true;
      source = ../../../../dotfiles/.config/kitty;
      target = ".config/kitty";
    };

    rofi = {
      recursive = true;
      source = ../../../../dotfiles/.config/rofi;
      target = ".config/rofi";
    };
  };
}
