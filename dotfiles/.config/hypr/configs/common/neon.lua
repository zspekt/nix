--------------------------------------------------------------------------------
-- neon ------------------------------------------------------------------------
--------------------------------------------------------------------------------
--
-- Not require()d by either entrypoint -- same as the old `# source = ./neon.conf`.

hl.config({
    general = {
        border_size = 4,
        gaps_in = 8,
        gaps_out = 16,

        col = {
            active_border = "rgb(d36937)",
            inactive_border = "rgba(1f1f2899)",
        },
    },

    decoration = {
        shadow = {
            enabled = true, -- was drop_shadow = 1
            range = 15,
            -- was shadow_render_power = 10; the option is capped at [1 - 4], so 10
            -- was already being clamped.
            render_power = 4,
            -- shadow_ignore_window no longer exists, dropped.
            offset = { 0, 0 },
            color = "rgb(d36937)",
            color_inactive = "0x1f1f2899",
        },
    },
})
