{ ... }:
{
  home.file = {
    waybarConfig = {
      recursive = false;
      source = ../../../../../dotfiles/.config/waybar/config.jsonc;
      target = ".config/waybar/config.jsonc";
    };
    waybarStyle = {
      recursive = false;
      source = ../../../../../dotfiles/.config/waybar/style.css;
      target = ".config/waybar/style.css";
    };
  };
}
