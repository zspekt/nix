{ ... }:
{
  users.users.zspekt = {
    extraGroups = [ "ydotool" ];
  };

  programs.ydotool.enable = true;
}
