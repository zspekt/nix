--------------------------------------------------------------------------------
-- misc ------------------------------------------------------------------------
--------------------------------------------------------------------------------

hl.config({
    binds = {
        -- keep these flags set to true or mod + tab will cycle between the
        -- three last active workspaces (including the current one)
        -- workspace_back_and_forth = true,
        allow_workspace_cycles = true,
    },
})

--------------------------------------------------------------------------------
-- modkeys ---------------------------------------------------------------------
--------------------------------------------------------------------------------

local mod = "SUPER"
local modS = "SUPER + SHIFT"
local modC = "SUPER + CTRL"
local modCS = "SUPER + CTRL + SHIFT" ---@diagnostic disable-line: unused-local

--------------------------------------------------------------------------------
-- brightness ctl --------------------------------------------------------------
--------------------------------------------------------------------------------

hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("light -A 5"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("light -U 5"))
hl.bind("SHIFT + XF86MonBrightnessUp", hl.dsp.exec_cmd("light -A 1"))
hl.bind("SHIFT + XF86MonBrightnessDown", hl.dsp.exec_cmd("light -U 1"))

--------------------------------------------------------------------------------
-- audio ctl -------------------------------------------------------------------
--------------------------------------------------------------------------------

-- the `repeating` flag will cause the command to be repeated if the key is held.
-- not required with the brightness keys.

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("pamixer -i 5"), { repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("pamixer -d 5"), { repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("pamixer -t"))
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("pamixer --default-source -t"))

--------------------------------------------------------------------------------
-- media ctl -------------------------------------------------------------------
--------------------------------------------------------------------------------

-- was `Control_L + SHIFT, backslash`. In lua a bare `Ctrl_L` is a keysym rather
-- than a modifier (and becomes press-order sensitive), so use the CTRL mod.
hl.bind("CTRL + SHIFT + backslash", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"))
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"))

--------------------------------------------------------------------------------
-- launch stuff ----------------------------------------------------------------
--------------------------------------------------------------------------------

-- exec_cmd runs through `sh -c`, so $HOME still expands
hl.bind(mod .. " + G", hl.dsp.exec_cmd("firefox"))
-- hl.bind(mod .. " + G", hl.dsp.exec_cmd("firefox -profile ~/.mozilla/firefox/j1w32yh8.default-release"))
-- hl.bind(modS .. " + G", hl.dsp.exec_cmd("firefox -profile ~/.mozilla/firefox/bsmm3ya7.codelampUdemyAccount"))
hl.bind(mod .. " + Z", hl.dsp.exec_cmd("$HOME/.local/bin/swaylock_dpms.sh"))
hl.bind(modS .. " + Z", hl.dsp.exec_cmd("swaylock"))
hl.bind(mod .. " + D", hl.dsp.exec_cmd("killall rofi || rofi -config /$HOME/.config/rofi/config_uncentered.rasi -show drun"))
hl.bind(modS .. " + D", hl.dsp.exec_cmd("killall rofi || $HOME/.local/bin/menu.sh"))
hl.bind(modS .. " + T", hl.dsp.exec_cmd("killall rofi || $HOME/.local/bin/sesh.sh"))
hl.bind(mod .. " + P", hl.dsp.exec_cmd("$HOME/.local/bin/passmenu.sh"))
hl.bind(modS .. " + P", hl.dsp.exec_cmd("$HOME/.local/bin/passmenu.sh --type"))

-- kitty
hl.bind(modC .. " + Return", hl.dsp.exec_cmd("kitty --execute tmux"))
hl.bind(mod .. " + Return", hl.dsp.exec_cmd("kitty"))

hl.bind(mod .. " + R", function()
    local wins = hl.get_windows({ class = "dropdown" })

    -- 1. missing -> just spawn. the window rule opens special:hdrop and takes
    --    focus when the window actually appears; toggling here would race the
    --    async exec and reveal an empty workspace.
    if #wins == 0 then
        hl.dispatch(hl.dsp.exec_cmd("$HOME/.local/bin/dropdown.sh"))
        return
    end

    local w = wins[1]
    local active = hl.get_active_window()
    local focused = active ~= nil and active.address == w.address

    -- 2. on screen but not focused -> focus it instead of hiding it
    if w.visible and not focused then
        hl.dispatch(hl.dsp.focus({ window = "address:" .. w.address }))
        return
    end

    -- 3. focused -> send it away / hidden -> bring it back
    hl.dispatch(hl.dsp.workspace.toggle_special("hdrop"))
end)

hl.bind("Print", hl.dsp.exec_cmd("$HOME/.local/bin/sswl.sh"))

--------------------------------------------------------------------------------
-- basic wm stuff --------------------------------------------------------------
--------------------------------------------------------------------------------

-- `hyprctl setprop opaque toggle` never worked. `opaque` is a dynamic prop that
-- can be set but not read back, so the toggle state is tracked here by address.
local opaqueWindows = {}

hl.bind(mod .. " + grave", function()
    local w = hl.get_active_window()
    if w == nil then
        return
    end

    local on = not opaqueWindows[w.address]
    opaqueWindows[w.address] = on or nil

    hl.dispatch(hl.dsp.window.set_prop({
        window = "address:" .. w.address,
        prop = "opaque",
        value = on and "1" or "0",
    }))
end)

hl.bind(modS .. " + Q", hl.dsp.window.close(), { repeating = true })
hl.bind(modS .. " + E", hl.dsp.exit())
hl.bind(mod .. " + V", hl.dsp.window.float())
hl.bind(mod .. " + W", hl.dsp.window.fullscreen({ mode = "maximized" })) -- monocle
hl.bind(mod .. " + F", hl.dsp.window.fullscreen({ mode = "fullscreen" })) -- actual fullscreen

--------------------------------------------------------------------------------
-- clipboard -------------------------------------------------------------------
--------------------------------------------------------------------------------

hl.bind(modC .. " + V", hl.dsp.exec_cmd("cliphist list | rofi -dmenu -p 'Clipboard  ' | cliphist decode | wl-copy"))

--------------------------------------------------------------------------------
-- master layout stuff ---------------------------------------------------------
--------------------------------------------------------------------------------

hl.bind(modS .. " + Return", hl.dsp.layout("swapwithmaster auto"))
hl.bind(mod .. " + J", hl.dsp.layout("cycleprev"), { repeating = true })
hl.bind(mod .. " + K", hl.dsp.layout("cyclenext"), { repeating = true })
hl.bind(mod .. " + L", hl.dsp.layout("mfact +0.05"), { repeating = true })
hl.bind(mod .. " + H", hl.dsp.layout("mfact -0.05"), { repeating = true })
hl.bind(mod .. " + I", hl.dsp.layout("addmaster"), { repeating = true })
hl.bind(mod .. " + O", hl.dsp.layout("removemaster"), { repeating = true })
hl.bind(mod .. " + T", hl.dsp.layout("orientationtop"))
hl.bind(mod .. " + C", hl.dsp.layout("orientationcenter"))
hl.bind(mod .. " + E", hl.dsp.layout("orientationleft"))
hl.bind(mod .. " + B", hl.dsp.layout("orientationbottom"))

-- dwindle keys (not optimal for master)
--
-- hl.bind(mod .. " + F", hl.dsp.window.pseudo())
-- hl.bind(mod .. " + O", hl.dsp.layout("togglesplit"))
-- hl.bind(mod .. " + h", hl.dsp.focus({ direction = "left" }))
-- hl.bind(mod .. " + l", hl.dsp.focus({ direction = "right" }))
-- hl.bind(mod .. " + k", hl.dsp.focus({ direction = "up" }))
-- hl.bind(mod .. " + j", hl.dsp.focus({ direction = "down" }))

-- hl.bind(modS .. " + h", hl.dsp.window.move({ direction = "left" }))
-- hl.bind(modS .. " + l", hl.dsp.window.move({ direction = "right" }))
-- hl.bind(modS .. " + k", hl.dsp.window.move({ direction = "up" }))
-- hl.bind(modS .. " + j", hl.dsp.window.move({ direction = "down" }))

-- switch workspace          / move window silently   / move window and follow
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0

    hl.bind(mod .. " + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind(modS .. " + " .. key, hl.dsp.window.move({ workspace = i, follow = false }))
    hl.bind(modC .. " + " .. key, hl.dsp.window.move({ workspace = i }))
end

hl.bind(mod .. " + M", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mod .. " + N", hl.dsp.focus({ workspace = "e-1" }))

hl.bind(modS .. " + M", hl.dsp.window.move({ workspace = "e+1", follow = false }))
hl.bind(modS .. " + N", hl.dsp.window.move({ workspace = "e-1", follow = false }))

hl.bind(modC .. " + M", hl.dsp.window.move({ workspace = "e+1" }))
hl.bind(modC .. " + N", hl.dsp.window.move({ workspace = "e-1" }))

-- Not the expected behaviour. Not currently useful.
hl.bind(mod .. " + Tab", hl.dsp.focus({ workspace = "previous" }), { repeating = true })

hl.bind(mod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
