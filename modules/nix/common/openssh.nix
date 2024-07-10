{ unstable, ... }:
{
  # Enable the OpenSSH daemon.

  programs.ssh = {
    package = unstable.openssh;
    startAgent = false;
    extraConfig = ''
      Host 192.168.1.128
        # raspi
        ForwardAgent yes
        RemoteForward /run/user/1000/gnupg/S.gpg-agent /run/user/1000/gnupg/S.gpg-agent.extra

      Host 192.168.1.244
        # thinkpad
        ForwardAgent yes
        RemoteForward /run/user/1000/gnupg/S.gpg-agent /run/user/1000/gnupg/S.gpg-agent.extra

      Host 192.168.1.162
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
  ];
}
