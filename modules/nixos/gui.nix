{ pkgs, ... }:

{
  programs.hyprland.enable = true;

  environment.systemPackages = with pkgs; [

    # wm
    hyprland

    # wm stuff
    rofi-wayland
    waybar
    hyprpaper

    # term
    kitty

    # browser
    firefox

    # msging apps
    discord-screenaudio
    discord
    webcord
    tg
    telegram-desktop

    # pdf reader
    zathura

    # screenshots
    grim
    slurp
    swappy

    # theming
    glib

    # misc
    wev
    wl-clipboard
    xwaylandvideobridge
    steam
  ];

  # simply adding 'nerdfonts' will install 5G worth of fonts
  # here we are specifying we only want firacode and jetbrainsmono
  fonts.packages = with pkgs; [
    (nerdfonts.override {
      fonts = [
        "FiraCode"
        "JetBrainsMono"
      ];
    })
  ];
}
