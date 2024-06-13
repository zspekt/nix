{ ... }:
{
  users.users.zspekt = {
    isNormalUser = true;
    extraGroups = [
      "wheel" # Enable ‘sudo’ for the user.
      "input"
      "networkmanager"
    ];
  };
}
