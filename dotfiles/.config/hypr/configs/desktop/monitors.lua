--------------------------------------------------------------------------------
-- monitors --------------------------------------------------------------------
--------------------------------------------------------------------------------

-- hl.config({ misc = { vrr = 1 } })

hl.monitor({ output = "DP-1", mode = "2560x1440@120", position = "0x0", scale = 1.0 }) -- vrr = 1
for i = 1, 7 do
    hl.workspace_rule({ workspace = tostring(i), monitor = "DP-1" })
end

-- the position of the display needs to take into account the scaling
-- 2560(original resolution) / 1.25 = 2048
-- hl.monitor({ output = "HDMI-A-2", mode = "1920x1080@60", position = "2048x0", scale = 1 })
-- hl.monitor({ output = "HDMI-A-2", mode = "1920x1080@60", position = "2560x640", scale = 1 }) --TODO: THIS IS THE GOOD ONE UNCOMMENT PLEEEEASE
hl.monitor({ output = "HDMI-A-1", mode = "1920x1080@60", position = "2560x0", scale = 1 })
for i = 8, 10 do
    hl.workspace_rule({ workspace = tostring(i), monitor = "HDMI-A-1" })
end

hl.monitor({ output = "Unknown-1", disabled = true })

hl.config({
    xwayland = {
        force_zero_scaling = true,
    },
})
