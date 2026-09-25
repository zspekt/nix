--------------------------------------------------------------------------------
-- sourcing --------------------------------------------------------------------
--------------------------------------------------------------------------------

-- common ----------------------------------------------------------------------

hl.config({
    debug = {
        disable_logs = false,
    },
})

require("configs.common.execs")
require("configs.common.misc")
require("configs.common.windowrules")
require("configs.common.keybinds")
require("configs.common.rice")

-- thpad specific --------------------------------------------------------------

require("configs.thpad.monitors")
require("configs.thpad.input")
