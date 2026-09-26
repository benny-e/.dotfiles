-- App launchers

local p = require("conf.programs")

hl.bind(p.mainMod .. " + Return", hl.dsp.exec_cmd(p.terminal))
hl.bind(p.mainMod .. " + E", hl.dsp.exec_cmd(p.fileManager))
hl.bind(p.mainMod .. " + B", hl.dsp.exec_cmd("brave"))
hl.bind(p.mainMod .. " + R", hl.dsp.exec_cmd("rofi -show drun -theme ~/.config/rofi/launcher.rasi"))
hl.bind(p.mainMod .. " + C", hl.dsp.exec_cmd("~/.config/hypr/scripts/clipboard.sh"))
