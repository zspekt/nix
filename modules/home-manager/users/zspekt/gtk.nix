{ pkgs, config, ... }:
{
  home.packages = [ pkgs.glib ]; # gsettings

  home.sessionVariables = {
    QT_AUTO_SCREEN_SCALE_FACTOR = 1;
    QT_QPA_PLATFORM = "wayland";
    # QT_QPA_PLATFORMTHEME = "qt5ct";
    XCURSOR_SIZE = "20";
    GTK_USE_PORTAL = "1";
  };

  home.pointerCursor = {
    package = pkgs.bibata-cursors;
    name = "Bibata-Original-Classic";
    size = 20;
    gtk.enable = true;
    x11.enable = true;
  };

  qt = {
    enable = true;
    platformTheme.name = "qt5ct";
    style = {
      # name = "Catppuccin-Frappe-Dark";
      package = pkgs.orchis-theme;
    };
  };

  gtk = {
    enable = true;

    theme = {
      name = "Orchis-Dark-Compact";
      package = pkgs.orchis-theme;
    };

    cursorTheme = {
      name = "Bibata-Original-Classic";
      package = pkgs.bibata-cursors;
      size = 20;
    };

    iconTheme = {
      name = "Colloid";
      package = pkgs.colloid-icon-theme;
    };

    font = {
      name = "JetBrainsMono Nerd Font Semi-Bold 13";
    };
  };
  dconf.settings."org/gnome/desktop/interface" = {
    color-scheme = "prefer-dark";
  };
}
