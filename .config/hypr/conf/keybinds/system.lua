-- Session controls

local p = require("conf.programs")
local mod = p.mainMod

hl.bind(mod .. " + M", hl.dsp.exit())
hl.bind(mod .. " + L", hl.dsp.exec_cmd("hyprlock --immediate-render --no-fade-in"))

-- Volume
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("~/.config/hypr/scripts/volume-osd.sh up"), {
    locked = true,
    repeating = true,
})
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("~/.config/hypr/scripts/volume-osd.sh down"), {
    locked = true,
    repeating = true,
})
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("~/.config/hypr/scripts/volume-osd.sh mute"))

-- Brightness
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("~/.config/hypr/scripts/brightness-osd.sh up"), {
    locked = true,
    repeating = true,
})
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("~/.config/hypr/scripts/brightness-osd.sh down"), {
    locked = true,
    repeating = true,
})

-- Media controls
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-- Screenshot
hl.bind("Print", hl.dsp.exec_cmd([[grimblast copy area && notify-send -a grimblast "Screenshot" "Copied to clipboard"]]))

-- Rofi click-to-close helper. Legacy bindn -> non_consuming = true.
hl.bind("mouse:272", hl.dsp.exec_cmd("~/.config/hypr/scripts/rofi-click-to-close.sh"), {
    non_consuming = true,
})
