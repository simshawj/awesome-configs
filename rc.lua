local awful = require("awful")
require("awful.autofocus")
local wibox = require("wibox")
local beautiful = require("beautiful")
local naughty = require("naughty")

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
    naughty.notify({ preset = naughty.config.presets.critical,
                     title = "Oops, there were errors during startup!",
                     text = awesome.startup_errors })
end

-- Handle runtime errors after startup
do
    local in_error = false
    awesome.connect_signal("debug::error", function (err)
        -- Make sure we don't go into an endless error loop
        if in_error then return end
        in_error = true

        naughty.notify({ preset = naughty.config.presets.critical,
                         title = "Oops, an error happened!",
                         text = err })
        in_error = false
    end)
end
-- }}}

-- This is used later as the default terminal and editor to run.
terminal = "urxvtc"
editor = os.getenv("EDITOR") or "vim"
editor_cmd = terminal .. " -e " .. editor
modkey = "Mod4"

dofile(awful.util.getdir("config") .. "/autostart.lua")
dofile(awful.util.getdir("config") .. "/screen.lua")
dofile(awful.util.getdir("config") .. "/menu.lua")
dofile(awful.util.getdir("config") .. "/mywibox.lua")
dofile(awful.util.getdir("config") .. "/keys.lua")
dofile(awful.util.getdir("config") .. "/myrules.lua")
dofile(awful.util.getdir("config") .. "/mysignals.lua")
