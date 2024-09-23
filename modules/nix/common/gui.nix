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

    # notif
    mako
    libnotify

    # msging apps
    discord-screenaudio
    betterdiscordctl
    unstable.discord
    (pkgs.discord.override {
      withOpenASAR = true;
      withVencord = true;
    })
    webcord
    telegram-desktop
    unstable.simplex-chat-desktop

    vesktop # something something screenshare with audio
    xwaylandvideobridge

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

    # streaming
    stremio

    # notes
    obsidian

    # torrent
    qbittorrent

    # archives
    unrar

    # file explorers
    dolphin
    xfce.thunar

    # misc
    wev
    steam

    wl-clipboard
    clipman
    # cliphist

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
