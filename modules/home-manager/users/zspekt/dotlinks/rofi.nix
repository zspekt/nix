{ ... }:
{
  home.file = {
    rofi = {
      recursive = true;
      source = ../../../../dotfiles/.config/rofi;
      target = ".config/rofi";
    };
  };
}
