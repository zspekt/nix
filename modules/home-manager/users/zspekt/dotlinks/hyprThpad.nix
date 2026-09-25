{ ... }:
{
  home.file = {

    hyprConf = {
      recursive = false;
      source = ../../../../../dotfiles/.config/hypr/hyprlandThpad.lua;
      target = "./.config/hypr/hyprland.lua";
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

    # lua_ls stub for the hl.* api
    hyprLuarc = {
      recursive = false;
      source = ../../../../../dotfiles/.config/hypr/.luarc.json;
      target = "./.config/hypr/.luarc.json";
    };
  };
}
