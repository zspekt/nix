{ pkgs, unstable, ... }:

{
  programs.hyprland.enable = true;

  security.pam.services.swaylock = { };

  environment.systemPackages = with pkgs; [

    # wm
    hyprland
    hdrop

    # wm stuff
    rofi # now apparently merged into rofi as of 25.11
    waybar
    hyprpaper
    swaylock

    unstable.kitty

    # browser
    unstable.firefox

    # unifi insecure - CVE-2026-22557 (CVSSv3.1 10.0/Critical) CVE-2026-22558 (CVSSv3.1 7.7/High)

    # notif
    mako
    libnotify

    # msging apps
    # discord-screenaudio # archived upstream -> use vesktop instead
    betterdiscordctl
    unstable.discord
    (pkgs.discord.override {
      withOpenASAR = true;
      withVencord = true;
    })
    # webcord
    telegram-desktop
    unstable.simplex-chat-desktop

    unstable.redact

    vesktop # something something screenshare with audio

    # pdf reader
    zathura

    # screenshots
    grim
    slurp
    swappy

    # theming
    glib
    libsForQt5.qt5.qtwayland

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
