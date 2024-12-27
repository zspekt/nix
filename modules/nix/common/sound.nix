{ pkgs, ... }:

{
  # sound (with pipewire)
  environment.systemPackages = with pkgs; [
    playerctl
    wireplumber
    pipewire
    pamixer
    pavucontrol
    easyeffects
    yelp # only for easyeffects (cringe)
  ];

  # sound.enable = true; removed as of 24.11 release
  security.rtkit.enable = true;

  services.pipewire = {
    systemWide = false;
    audio.enable = true;
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
    wireplumber.enable = true;
    alsa.support32Bit = true;
  };
}
