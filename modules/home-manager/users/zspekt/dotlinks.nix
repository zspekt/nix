{ hostname, ... }:
{

  imports =

    if "${hostname}" == "nixos" then
      [
        ./dotlinks/hyprDesktop.nix
        ./dotlinks/waybarDesktop.nix
        ./dotlinks/kitty.nix
        ./dotlinks/rofi.nix
        ./dotlinks/mako.nix
      ]
    else if "${hostname}" == "nixth" then
      [
        ./dotlinks/hyprThpad.nix
        ./dotlinks/waybarThpad.nix
        ./dotlinks/kitty.nix
        ./dotlinks/rofi.nix
        ./dotlinks/mako.nix
      ]
    else if "${hostname}" == "nixpi" then
      [ ]
    else
      throw "unknown host";

  # source defines the path within the nix store
  # from the perspective of the file.
  # whereas target defines the path within home where we want the links
  # when linking a dir, the whole dir will be read-only — not just its contents

  home.file =
    let
      homeDir = ../../../../dotfiles;
      configDir = homeDir + /.config;
    in
    {
      neovim = {
        recursive = true;
        source = configDir + /nvim;
        target = "./.config/nvim";
      };

      zshPluginList = {
        recursive = false;
        source = homeDir + /.zsh/zsh_plugins.txt;
        target = "./.zsh/zsh_plugins.txt";
      };

      zshrc = {
        recursive = false;
        source = homeDir + /.zshrc;
        target = "./.zshrc";
      };

      p10k = {
        recursive = false;
        source = homeDir + /.p10k.zsh;
        target = "./.p10k.zsh";
      };

      tmux = {
        recursive = true;
        source = configDir + /tmux;
        target = ".config/tmux";
      };

      tmuxTpm = {
        recursive = true;
        source = homeDir + /.tmux/plugins/tpm;
        target = ".tmux/plugins/tpm";
      };

      tmuxSesh = {
        recursive = true;
        source = configDir + /sesh;
        target = "./.config/sesh";
      };

      tmuxinator = {
        recursive = true;
        source = configDir + /tmuxinator;
        target = "./.config/tmuxinator";
      };

      scripts = {
        recursive = true;
        source = homeDir + /.local/bin;
        target = "./.local/bin";
        executable = true;
      };
    };
}
