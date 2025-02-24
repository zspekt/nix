{ ... }:
{
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
        target = ".config/tmux/plugins/tpm";
      };

      kitty = {
        recursive = true;
        source = ../../../../../dotfiles/.config/kitty;
        target = ".config/kitty";
      };
    };
}
