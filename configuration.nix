# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];


	nixpkgs.config = {
	allowUnfree = true;
};

	  # Enable OpenGL
	  hardware.opengl = {
	    enable = true;
	    driSupport = true;
	    driSupport32Bit = true;
	  };

# Load nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = ["nvidia"];

  nix.settings.experimental-features = ["nix-command" "flakes"];

hardware.nvidia = {

    # Modesetting is required.
    modesetting.enable = true;

    # Nvidia power management. Experimental, and can cause sleep/suspend to fail.
    # Enable this if you have graphical corruption issues or application crashes after waking
    # up from sleep. This fixes it by saving the entire VRAM memory to /tmp/ instead 
    # of just the bare essentials.
    powerManagement.enable = false;

    # Fine-grained power management. Turns off GPU when not in use.
    # Experimental and only works on modern Nvidia GPUs (Turing or newer).
    powerManagement.finegrained = false;

    # Use the NVidia open source kernel module (not to be confused with the
    # independent third-party "nouveau" open source driver).
    # Support is limited to the Turing and later architectures. Full list of 
    # supported GPUs is at: 
    # https://github.com/NVIDIA/open-gpu-kernel-modules#compatible-gpus 
    # Only available from driver 515.43.04+
    # Currently alpha-quality/buggy, so false is currently the recommended setting.
    open = false;

    # Enable the Nvidia settings menu,
	# accessible via `nvidia-settings`.
    nvidiaSettings = true;

    # Optionally, you may need to select the appropriate driver version for your specific GPU.
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.luks.devices.luksroot = {
     device = "/dev/disk/by-uuid/3d294f20-e898-4030-8456-f0aee7a16ae9";
     preLVM = true;
     allowDiscards = true;
  };


  # networking.hostName = "nixos"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Set your time zone.
  # time.timeZone = "Europe/Amsterdam";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  # console = {
    # font = "Lat2-Terminus16";
    # keyMap = "us";
    # useXkbConfig = true; # use xkb.options in tty.
  # };

  # Enable the X11 windowing system.
  # services.xserver.enable = true;


  # Enable the Plasma 5 Desktop Environment.
  # services.xserver.displayManager.sddm.enable = true;
  # services.xserver.desktopManager.plasma5.enable = true;
  

  # Configure keymap in X11
  # services.xserver.xkb.layout = "us";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # sound.enable = true;
  # hardware.pulseaudio.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.

    users.users.zspekt = {
    shell = pkgs.zsh;
    isNormalUser = true;
    extraGroups = [ "wheel" "input" "networkmanager" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      firefox
      hyprland
      kitty
      ripgrep
      zoxide
      wl-clipboard
      pass
      discord-screenaudio
      discord
      xwaylandvideobridge
      tg
      telegram-desktop
      rofi-wayland
      waybar
      pass-wayland
      gh
      playerctl

      grim
      slurp
      swappy
      wev
      # antidote
  #     tree
    ];
  };

    # Enable GPG at a system level 
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    enableExtraSocket = true;
  };



  users.users.zspekt.openssh.authorizedKeys.keys = [
  "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCdjc5dulbNt/kFWD4gz2V0QKzITX8WK9XOZoRC1cAi57Lrl2Wmx5m92ZuRis2uT2cUe/aZ8dhXxUjBs8aeqWT4rZpmyO1osle/RLfas0MUdinGfr7mfrEn9Kt8NJHREuvx4Gm6Ry2iU0bl1SuGbwNRorQNBNmLLkBi2hNqZTLO6ZkJNIViRhOX6DQ6UEeEDtG5cVhdIh3VBODrGFm+Y6pk3WUfS8HxyZ6zdVNRKI6NxF0d4H/gRvV+2Rwf/BLooEIXGga5OW9k1gKgCNrLrcwRg7VOnwAbnSMihV7KLfOv+qQ6GH0hiTajpnc7uuBwlMZseqTAlcMGhAOOygf9DNPc4IW+QDqcqzdo+5DAdpOQNlKmq6M+gDzPvlaxBdO97CAdkZhKi4xUNb5I9goJK6LU6XLgQSCjfLpqEZ+w1rrQJkUfIRf+bYq/gTuTolJtHrvxtUrlLQBlFVQdycngbrhY05N/IJlUOBuOd4yt5EO5MEeYBLhXhNUnI0+7gMhuHa875shK9QhTeCARiCCHjHMsUCr7wFBQQ74/Kz1z7+TArRoEvL7f6dgPNHXQ6bSo+E7mtrLOWBq5Jkw7F6TsuLeNGPule/Gjx5qH+cKWFn7dt4H8xvujaQHyrZvwRzxAp1kvQyuKdM6H1RWMUCOLZVrODZowEYQQW2HHLIss1hr8sQ== cardno:14 977 425"
  ];

programs.ssh.startAgent = false; # GPG act as ssh-agent

environment.variables = {
    GPG_TTY = "${pkgs.coreutils}/bin/tty";
    SSH_AUTH_SOCK = "/run/user/1000/gnupg/S.gpg-agent.ssh";
  };

  # Enable GPG Smartcards (Like Yubikeys)
  hardware.gpgSmartcards.enable = true;


  users.defaultUserShell = pkgs.zsh;

  programs.hyprland.enable = true;
  programs.zsh.enable = true;
  programs.nano.enable = false;
  programs.neovim.defaultEditor = true;

  services.pcscd.enable = true;
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [

     home-manager
     neovim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
     wget
     curl
     vim
     git
     tmux
     neofetch
     fzf
     coreutils
     antidote
     bat


    luarocks
    unzip
    go
    python3

     pinentry-qt

     # vim>
     gcc

    # go
    gopls

    # python
    black
    # debugpy
    mypy
    ruff
    pyright


   # js
    biome
    pkgs.nodePackages.typescript-language-server

    # js-debug-adapter

   # shell
   shfmt
   shellcheck

   # sql

   # sqlls not available
   # sqls possible alternative
   sqlfluff

  # css
   # vscode-langservers-extracted # alternative?
   # css-lsp not available
   stylelint

  # c
   # clang-format not available

# misc
   nodePackages.prettier

  btop
  htop
  cmatrix

    # sound
    wireplumber
    pipewire
    pamixer
    pavucontrol

# nix
    nil
    alejandra
    nixfmt-rfc-style
    statix
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

  # simply adding 'nerdfonts' will install 5G worth of fonts
  # here we are specifying we only want firacode and jetbrainsmono
  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraCode" "JetBrainsMono" ]; })
  ];


  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "23.11"; # Did you read the comment?

}


