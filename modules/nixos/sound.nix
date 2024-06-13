{ pkgs, ... }:

{
  # sound (with pipewire)
  environment.systemPackages = with pkgs; [
    playerctl
    wireplumber
    pipewire
    pamixer
    pavucontrol
  ];

  sound.enable = true;
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
