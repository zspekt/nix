--------------------------------------------------------------------------------
-- visuals ---------------------------------------------------------------------
--------------------------------------------------------------------------------

hl.config({
    decoration = {
        -- See https://wiki.hypr.land/Configuring/Basics/Variables/ for more

        rounding = 5,

        blur = {
            enabled = true,
            size = 6,
            passes = 3,
            new_optimizations = true,
            ignore_opacity = true,
            xray = false,
        },

        -- blur = {
        --     enabled = true,
        --     size = 8,
        --     passes = 1,
        --     new_optimizations = true,
        --     ignore_opacity = false,
        --     brightness = 1.0,
        --     xray = false,
        --     vibrancy = 0.50,
        --     vibrancy_darkness = 0.50,
        --     contrast = 1.0,
        -- },

        shadow = {
            enabled = false,
            range = 4,
            render_power = 3,
            color = "rgba(1a1a1aee)",
        },
    },
})

hl.layer_rule({ match = { namespace = "rofi" }, blur = true })
-- the old commented-out `blurls = waybar` / `blurls = lockscreen` would now be:
-- hl.layer_rule({ match = { namespace = "waybar" }, blur = true })

hl.config({
    animations = {
        enabled = true,
    },
})

-- Some default animations, see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/ for more
hl.curve("myBezier", { type = "bezier", points = { { 0.10, 0.9 }, { 0.1, 1.05 } } })

hl.animation({ leaf = "windows", enabled = true, speed = 7, bezier = "default", style = "slide" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 7, bezier = "myBezier", style = "slide" })
-- hl.animation({ leaf = "border", enabled = true, speed = 20, bezier = "default" })
hl.animation({ leaf = "fade", enabled = true, speed = 7, bezier = "default" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 6, bezier = "default" })
-- dropdown slides down from the top of the screen
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 5, bezier = "myBezier", style = "slidevert" })

hl.config({
    general = {
        -- See https://wiki.hypr.land/Configuring/Basics/Variables/ for more

        -- cursor_inactive_timeout = 8, -- now cursor.inactive_timeout, set in misc.lua
        gaps_in = 8,
        gaps_out = 16,
        border_size = 3,

        col = {
            -- active_border = { colors = { "rgba(33ccffee)", "rgba(FF1493ee)" }, angle = 300 },
            active_border = "rgb(d36937)",
            inactive_border = "rgba(1f1f2899)",
        },

        -- layout = "master",
    },

    misc = {
        -- focus_on_activate = false,
        disable_hyprland_logo = true,
    },
})

-- require("configs.common.neon")
