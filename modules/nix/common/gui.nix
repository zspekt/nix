{ pkgs, unstable, ... }:

{
  programs.hyprland.enable = true;

  security.pam.services.swaylock = { };

  environment.systemPackages = with pkgs; [

    # wm
    hyprland
    hdrop

    # wm stuff
    rofi-wayland
    waybar
    hyprpaper
    swaylock

    unstable.kitty

    # browser
    unstable.firefox

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
    kdePackages.xwaylandvideobridge

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

    # notes
    obsidian

    scrcpy # share android screen
    android-tools

    # torrent
    unstable.qbittorrent # stable has an RCE

    # archives
    unrar

    # file explorers
    kdePackages.dolphin
    xfce.thunar

    # misc
    wev
    showmethekey
    steam

    wl-clipboard
    clipman
    # cliphist

    xdg-utils
  ];

  # simply adding 'nerdfonts' will install 5G worth of fonts
  # here we are specifying we only want firacode and jetbrainsmono
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code

    # deprecated
    # (nerdfonts.override {
    #   fonts = [
    #     "FiraCode"
    #     "JetBrainsMono"
    #   ];
    # })
  ];
}
