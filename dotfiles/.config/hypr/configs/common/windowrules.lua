--------------------------------------------------------------------------------
-- general ---------------------------------------------------------------------
--------------------------------------------------------------------------------

-- Keep pinentry windows focused
hl.window_rule({ match = { class = "^(pinentry-)" }, stay_focused = true })

-- Float specific apps
hl.window_rule({ match = { class = "^(pavucontrol)$" }, float = true })
hl.window_rule({ match = { class = "^(blueman-manager)$" }, float = true })
hl.window_rule({ match = { class = "^(nm-connection-editor)$" }, float = true })
hl.window_rule({ match = { title = "^(btop)$" }, float = true })

-- Example windowrule
-- hl.window_rule({ match = { class = "^(kitty)$", title = "^(kitty)$" }, float = true })
-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/

-- Disabled due to lag when switching to transparent Firefox
-- hl.window_rule({ match = { class = "^(firefox)$" }, opacity = "0.9 0.9" })

--------------------------------------------------------------------------------
--- dropdown (thx contre) ------------------------------------------------------
--------------------------------------------------------------------------------
-- one rule per effect, float FIRST: `move`/`size` only apply to floating
-- windows, and key order within a single lua table is undefined.
-- `move`/`size` no longer take percentages; monitor_w/monitor_h expressions are
-- the documented equivalent (15% / 70% / 40% of the monitor).
hl.window_rule({ match = { class = "^(dropdown)$" }, float = true })
hl.window_rule({ match = { class = "^(dropdown)$" }, size = { "monitor_w*0.7", "monitor_h*0.4" } })
hl.window_rule({ match = { class = "^(dropdown)$" }, move = { "monitor_w*0.15", "200" } })
hl.window_rule({ match = { class = "^(dropdown)$" }, workspace = "special:hdrop" })


--------------------------------------------------------------------------------
--- screen sharing -------------------------------------------------------------
--------------------------------------------------------------------------------

hl.window_rule({
    match = { class = "^(xwaylandvideobridge)$" },

    opacity = "0.0 override 0.0 override",
    no_anim = true,
    no_focus = true,
    no_initial_focus = true,
})

--------------------------------------------------------------------------------
-- steam -----------------------------------------------------------------------
--------------------------------------------------------------------------------

hl.window_rule({
    match = { title = "^()$", class = "^(steam)$" },

    stay_focused = true,
    min_size = { 1, 1 },
})
