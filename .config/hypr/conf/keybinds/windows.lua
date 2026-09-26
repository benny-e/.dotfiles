-- Window controls

local p = require("conf.programs")
local mod = p.mainMod

hl.bind(mod .. " + Q", hl.dsp.window.close())
hl.bind(mod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mod .. " + F", hl.dsp.window.fullscreen({ action = "toggle", mode = "fullscreen" }))
hl.bind(mod .. " + P", hl.dsp.window.pseudo({ action = "toggle" }))
hl.bind(mod .. " + J", hl.dsp.layout("togglesplit"))

-- Focus movement with arrow keys
hl.bind(mod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mod .. " + down",  hl.dsp.focus({ direction = "down" }))

-- Focus movement with vim keys
hl.bind(mod .. " + SHIFT + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mod .. " + SHIFT + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mod .. " + SHIFT + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mod .. " + SHIFT + J", hl.dsp.focus({ direction = "down" }))

-- Move and resize windows with mouse
hl.bind(mod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
