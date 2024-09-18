{ ... }:
{
  users.users.zspekt = {
    isNormalUser = true;
    uid = 1000;
    extraGroups = [
      "wheel" # Enable ‘sudo’ for the user.
      "input"
      "video"
    ];
  };
}
