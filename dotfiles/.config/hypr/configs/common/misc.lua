--------------------------------------------------------------------------------
-- general settings ------------------------------------------------------------
--------------------------------------------------------------------------------

hl.config({
    general = {
        -- See https://wiki.hypr.land/Configuring/Basics/Variables/ for more
        layout = "master",
    },

    cursor = {
        inactive_timeout = 1,
    },

    misc = {
        focus_on_activate = false,
        disable_hyprland_logo = true,
        disable_splash_rendering = true,
        mouse_move_enables_dpms = false, -- prevents accidental wake up
        key_press_enables_dpms = true,
    },

    dwindle = {
        -- See https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/ for more
        -- apparently does not exist anymore
        -- pseudotile = true, -- master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
        preserve_split = true, -- you probably want this
    },

    master = {
        -- See https://wiki.hypr.land/Configuring/Layouts/Master-Layout/ for more
        new_status = "master",
        -- new_status = "inherit",
        -- new_status = "slave",
    },
})
