{ ... }:
{
  home.file = {
    waybarConfig = {
      recursive = false;
      source = ../../../../../dotfiles/.config/waybar/configThpad.jsonc;
      target = ".config/waybar/config.jsonc";
    };
    waybarStyle = {
      recursive = false;
      source = ../../../../../dotfiles/.config/waybar/styleThpad.css;
      target = ".config/waybar/style.css";
    };
  };
}
