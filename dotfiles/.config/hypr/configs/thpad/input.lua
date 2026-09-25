--------------------------------------------------------------------------------
-- input settings --------------------------------------------------------------
--------------------------------------------------------------------------------

hl.config({
    input = {
        kb_layout = "us",
        kb_variant = "mac",
        kb_model = "",
        -- kb_options = "caps:swapescape",

        follow_mouse = 1,

        touchpad = {
            natural_scroll = false,
            scroll_factor = 0.8,
        },

        sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.
    },
})

-- `gestures { workspace_swipe = off }` is gone: gestures are now opt-in per
-- gesture via hl.gesture(), so declaring none leaves the swipe disabled.
-- To enable it:
-- hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })
