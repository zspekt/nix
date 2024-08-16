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
    chromium

    # msging apps
    discord-screenaudio
    betterdiscordctl
    unstable.discord
    (pkgs.discord.override {
      withOpenASAR = true;
      withVencord = true;
    })
    webcord
    tg
    telegram-desktop

    vesktop

    # pdf reader
    zathura

    # screenshots
    grim
    slurp
    swappy

    # theming
    glib
    libsForQt5.qt5.qtwayland
    qt5.full

    # players
    mpv
    vlc

    # misc
    wev
    wl-clipboard
    xwaylandvideobridge
    steam
    clipman
    cliphist
    xdg-utils
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
