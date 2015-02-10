local awful = require("awful")
local beautiful = require("beautiful")
local gears = require("gears")


local myscreen = {}

function myscreen.init() 

    beautiful.init("~/.config/awesome/themes/default/theme.lua")

    layouts =
    {
        awful.layout.suit.floating,
        awful.layout.suit.tile,
        awful.layout.suit.tile.left,
        awful.layout.suit.tile.bottom,
        awful.layout.suit.tile.top,
        awful.layout.suit.fair,
        awful.layout.suit.fair.horizontal,
        awful.layout.suit.max,
        awful.layout.suit.max.fullscreen,
        awful.layout.suit.magnifier
    }

    if beautiful.wallpaper then
        for s = 1, screen.count() do
            gears.wallpaper.maximized(beautiful.wallpaper, s, true)
        end
    end

    tags = {
        names   = {1, 2, 3, 4, 5, 6, 7, 8, 9 },
        layout  = { layouts[2], layouts[2], layouts[2], layouts[2], layouts[2],
                    layouts[2], layouts[2], layouts[2], layouts[2] }
    }

    for s = 1, screen.count() do
        tags[s] = awful.tag(tags.names, s, tags.layout)
    end
end

return myscreen
