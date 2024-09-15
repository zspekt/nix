{ unstable, ... }:
{
  # Enable the OpenSSH daemon.

  programs.ssh = {
    package = unstable.openssh;
    startAgent = false;
    extraConfig = ''
      Host nixpi.lan
        # raspi
        ForwardAgent yes
        RemoteForward /run/user/1000/gnupg/S.gpg-agent /run/user/1000/gnupg/S.gpg-agent.extra

      Host nixth.lan
        # thinkpad
        ForwardAgent yes
        RemoteForward /run/user/1000/gnupg/S.gpg-agent /run/user/1000/gnupg/S.gpg-agent.extra

      Host nixos.lan
        # desktop
        ForwardAgent yes
        RemoteForward /run/user/1000/gnupg/S.gpg-agent /run/user/1000/gnupg/S.gpg-agent.extra
    '';
  };

  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      PermitRootLogin = "no";
    };
    extraConfig = ''StreamLocalBindUnlink yes'';
  };

  users.users.zspekt.openssh.authorizedKeys.keys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCdjc5dulbNt/kFWD4gz2V0QKzITX8WK9XOZoRC1cAi57Lrl2Wmx5m92ZuRis2uT2cUe/aZ8dhXxUjBs8aeqWT4rZpmyO1osle/RLfas0MUdinGfr7mfrEn9Kt8NJHREuvx4Gm6Ry2iU0bl1SuGbwNRorQNBNmLLkBi2hNqZTLO6ZkJNIViRhOX6DQ6UEeEDtG5cVhdIh3VBODrGFm+Y6pk3WUfS8HxyZ6zdVNRKI6NxF0d4H/gRvV+2Rwf/BLooEIXGga5OW9k1gKgCNrLrcwRg7VOnwAbnSMihV7KLfOv+qQ6GH0hiTajpnc7uuBwlMZseqTAlcMGhAOOygf9DNPc4IW+QDqcqzdo+5DAdpOQNlKmq6M+gDzPvlaxBdO97CAdkZhKi4xUNb5I9goJK6LU6XLgQSCjfLpqEZ+w1rrQJkUfIRf+bYq/gTuTolJtHrvxtUrlLQBlFVQdycngbrhY05N/IJlUOBuOd4yt5EO5MEeYBLhXhNUnI0+7gMhuHa875shK9QhTeCARiCCHjHMsUCr7wFBQQ74/Kz1z7+TArRoEvL7f6dgPNHXQ6bSo+E7mtrLOWBq5Jkw7F6TsuLeNGPule/Gjx5qH+cKWFn7dt4H8xvujaQHyrZvwRzxAp1kvQyuKdM6H1RWMUCOLZVrODZowEYQQW2HHLIss1hr8sQ== cardno:14 977 425"
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDMWlOGeTpyD65yLByrVVfnDEneKn0qOd56URgXfMr0vnyNUBcIb5GLePugQIIw6GLdYydcuAcC2XE8vLkcXYIxSn8V4eZJvSIZn50rhqY70RJjMVpSwbkSiFB6D0j4t/NpCxNQ1xXwrQrj6t/XPBg0AKYkTiwzZRCjQPPB/wrTFoOV3XqdqFEVBT6wwPp+T3oONOpdfL18Gjie+2Tclb7isQ0I+r2BF8jeajquV8ZWIjAFrtHiEYsKpfR0AQD9BzWljyfP6cSsLpw+ttvaLz4JnsFy/TdTMMy+jkavc16mUzIjfQKC0bMhgGKUQyEkIRVNJ0Ub6IhBQ+gcMblEYy6xzSQnN67DN91fH8ZSybmaZwjTlkYOMnBc3girYVg4Qlc0QWJm3K2c68BUXNTJHHO4OX8jkdDTzkZa2PjMinyG6xNFirepMyenB6V63js1sgg4LOwezO428NQGJ+omHHW0lBHIiw5yrHtovM/QLLtC+6nMxsEx5xPXZDP5sdjqsqqt/b1ah7T+dsQkPqrtjiWEz7wKH7Sak9RJH3iYBAc40zmxZj5R43vPkslguSJB36KSr07MFHkZETiFZaKCyoZQFfc82gab4QPNYx92DPujU9d34TXLt3NrC2VrtoxHFGCXDxd8TrpKPhys8+YOdDzZW/xsa5a7wMEVOAF8RD72Ww== cardno:22_529_917"
  ];
}
