--------------------------------------------------------------------------------
-- run when hyprland starts ----------------------------------------------------
--------------------------------------------------------------------------------

hl.on("hyprland.start", function()
    hl.exec_cmd("hyprpaper")
    -- Wayland magic (screen sharing etc.)
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
    -- More wayland magic (screen sharing etc.)
    hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
    hl.exec_cmd("mako")
    hl.exec_cmd("waybar") -- bar
    hl.exec_cmd("blueman-applet") -- bluetooth applet
    hl.exec_cmd("nm-applet --indicator") -- network applet
    hl.exec_cmd("wl-paste --watch cliphist store")
    hl.exec_cmd("yubikey-touch-detector --libnotify")
end)
