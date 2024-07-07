{ ... }:
{
  home.file = {
    hypr = {
      recursive = true;
      source = ../../../../../dotfiles/.config/hypr;
      target = "./.config/hypr";
    };
  };
}
