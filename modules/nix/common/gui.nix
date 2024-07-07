{ pkgs, unstable, ... }:

{
  programs.hyprland.enable = true;

  security.pam.services.swaylock = { };

  environment.systemPackages = with pkgs; [

    # wm
    hyprland

    # wm stuff
    rofi-wayland
    waybar
    hyprpaper
    swaylock

    # term
    kitty

    # browser
    firefox

    # msging apps
    discord-screenaudio
    unstable.discord
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

    # players
    mpv
    vlc

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
