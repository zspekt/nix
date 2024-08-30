{ ... }:
{
  home.file = {
    mako = {
      source = ../../../../../dotfiles/.config/mako/config;
      target = "./.config/mako/config";
    };
  };
}
