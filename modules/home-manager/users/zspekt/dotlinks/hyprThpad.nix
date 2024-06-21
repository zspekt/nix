{ ... }:
{
  home.file = {

    hyprConf = {
      recursive = false;
      source = ../../../../../dotfiles/.config/hypr/hyprlandThpad.conf;
      target = "./.config/hypr/hyprland.conf";
    };

    hyprConfigs = {
      recursive = true;
      source = ../../../../../dotfiles/.config/hypr/configs;
      target = "./.config/hypr/configs";
    };

    hyprPaper = {
      recursive = false;
      source = ../../../../../dotfiles/.config/hypr/hyprpaperThpad.conf;
      target = "./.config/hypr/hyprpaper.conf";
    };
  };
}
