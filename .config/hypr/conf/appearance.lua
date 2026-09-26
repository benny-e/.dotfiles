-- General layout and appearance

hl.config({
    general = {
        gaps_in = 6,
        gaps_out = 16,
        border_size = 2,

        col = {
            active_border = 0xFF3A3F45,
            inactive_border = 0xFF1A1D21,
        },

        resize_on_border = false,
        allow_tearing = false,
        layout = "dwindle",
    },

    decoration = {
        rounding = 1,
        rounding_power = 1,

        active_opacity = 1.0,
        inactive_opacity = 1.0,

        shadow = {
            enabled = true,
            range = 4,
            render_power = 3,
            color = "rgba(1a1a1aee)",
        },

        blur = {
            enabled = true,
            size = 3,
            passes = 1,
            vibrancy = 0.1696,
        },
    },

    animations = {
        enabled = true,
    },

    dwindle = {
        -- pseudotile was removed in Hyprland 0.55; the per-window pseudo
        -- dispatcher still works normally.
        preserve_split = true,
    },

    master = {
        new_status = "master",
    },

    misc = {
        force_default_wallpaper = -1,
        disable_hyprland_logo = true,
    },
})

-- Animation curves
hl.curve("smooth", {
    type = "bezier",
    points = { { 0.25, 1 }, { 0.5, 1 } },
})

hl.curve("quick", {
    type = "bezier",
    points = { { 0.15, 0 }, { 0.1, 1 } },
})

hl.curve("soft", {
    type = "bezier",
    points = { { 0.2, 0.9 }, { 0.3, 1.0 } },
})

-- Animations
hl.animation({ leaf = "windows",     enabled = true, speed = 3, bezier = "soft",   style = "popin 90%" })
hl.animation({ leaf = "windowsIn",   enabled = true, speed = 3, bezier = "soft",   style = "popin 90%" })
hl.animation({ leaf = "windowsOut",  enabled = true, speed = 2, bezier = "quick",  style = "popin 90%" })
hl.animation({ leaf = "windowsMove", enabled = true, speed = 2, bezier = "quick" })

hl.animation({ leaf = "border",      enabled = true, speed = 3, bezier = "smooth" })
hl.animation({ leaf = "fade",        enabled = true, speed = 2, bezier = "quick" })

hl.animation({ leaf = "workspaces",  enabled = true, speed = 3, bezier = "quick",  style = "fade" })

hl.animation({ leaf = "layers",      enabled = true, speed = 2, bezier = "smooth", style = "fade" })
hl.animation({ leaf = "layersIn",    enabled = true, speed = 2, bezier = "smooth", style = "fade" })
hl.animation({ leaf = "layersOut",   enabled = true, speed = 2, bezier = "quick",  style = "fade" })
