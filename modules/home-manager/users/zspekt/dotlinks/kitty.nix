{ ... }:
{
  home.file = {
    kitty = {
      recursive = true;
      source = ../../../../../dotfiles/.config/kitty;
      target = ".config/kitty";
    };
  };
}
