---@module 'hl'

hl.monitor({
    output   = "",
    mode     = "2560x1440@74.97",
    position = "auto",
    scale    = 1.6,
})

--1.6 - HiDPI

-- https://wiki.hyprland.org/Configuring/Variables/#misc

hl.config({
    misc = {
        force_default_wallpaper = -1,
        disable_hyprland_logo = false,
        vrr = 1,
        animate_manual_resizes = false,
        animate_mouse_windowdragging = false,
        enable_swallow = true,
        -- отображение терминала при запуске в нём приложения
        swallow_regex = "(foot|kitty|allacritty|Alacritty)",
        disable_hyprland_logo = true,
        force_default_wallpaper = 0,
        allow_session_lock_restore = true,
        initial_workspace_tracking = false,
    },
})

-- https://wiki.hyprland.org/Configuring/Variables/#gestures

hl.config({
    xwayland = {
        force_zero_scaling = true,
    },
})

hl.config({
    general = {
        gaps_in = 2,
        gaps_out = 0,
        border_size = 3,
        -- https://wiki.hyprland.org/Configuring/Variables/#variable-types for info about colors
        -- Set to true enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = false,
        -- Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
        allow_tearing = false,
        layout = "dwindle",
        col = {
            active_border = "rgb(4c566a)",
            inactive_border = "rgba(595959aa)",
        },
    },
})

hl.config({
    dwindle = {
        preserve_split = true,
        smart_split = false,
        smart_resizing = false,
    },
})

hl.config({
    decoration = {
        rounding = 0,
        -- Change transparency of focused and unfocused windows
        active_opacity = 1.0,
        inactive_opacity = 1,
        shadow = {
            enabled = true,
            range = 4,
            render_power = 3,
            color = "rgba(1a1a1aee)",
        },
        -- https://wiki.hyprland.org/Configuring/Variables/#blur
        blur = {
            --enabled = true
            --size = 4
            --passes = 1
            --vibrancy = 0.1696
            --xray = false
            --special = false
            --ignore_opacity = false
            enabled = true,
            xray = false,
            ignore_opacity = false,
            special = false,
            new_optimizations = true,
            size = 4,
            passes = 1,
            brightness = 1,
            noise = 0.01,
            contrast = 1,
            popups = true,
            popups_ignorealpha = 0.6,
        },
    },
})

hl.config({ animations = { enabled = true } })

hl.curve("linear", { type = "bezier", points = { { 0.0, 0.0 }, { 1.0, 1.0 } } })
hl.curve("md3_standard", { type = "bezier", points = { { 0.2, 0.0 }, { 0.0, 1.0 } } })
hl.curve("md3_decel", { type = "bezier", points = { { 0.05, 0.7 }, { 0.1, 1.0 } } })
hl.curve("md3_accel", { type = "bezier", points = { { 0.3, 0.0 }, { 0.8, 0.15 } } })
hl.curve("overshot", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.1 } } })
hl.curve("crazyshot", { type = "bezier", points = { { 0.1, 1.5 }, { 0.76, 0.92 } } })
hl.curve("hyprnostretch", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.0 } } })
hl.curve("menu_decel", { type = "bezier", points = { { 0.1, 1.0 }, { 0.0, 1.0 } } })
hl.curve("menu_accel", { type = "bezier", points = { { 0.38, 0.04 }, { 1.0, 0.07 } } })
hl.curve("easeInOutCirc", { type = "bezier", points = { { 0.85, 0.0 }, { 0.15, 1.0 } } })
hl.curve("easeOutCirc", { type = "bezier", points = { { 0.0, 0.55 }, { 0.45, 1.0 } } })
hl.curve("easeOutExpo", { type = "bezier", points = { { 0.16, 1.0 }, { 0.3, 1.0 } } })
hl.curve("softAcDecel", { type = "bezier", points = { { 0.26, 0.26 }, { 0.15, 1.0 } } })
hl.curve("md2", { type = "bezier", points = { { 0.4, 0.0 }, { 0.2, 1.0 } } })

hl.animation({ leaf = "windows", enabled = true, speed = 3, bezier = "md3_decel", style = "popin" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 3, bezier = "md3_decel", style = "popin" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 3, bezier = "md3_accel", style = "popin" })
hl.animation({ leaf = "border", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "fade", enabled = true, speed = 3, bezier = "md3_decel" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 3, bezier = "menu_decel", style = "slide" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.6, bezier = "menu_accel" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 2, bezier = "menu_decel" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 0.5, bezier = "menu_accel" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 7, bezier = "menu_decel", style = "slide" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 3, bezier = "md3_decel", style = "slidevert" })

hl.config({
    opengl = {
        nvidia_anti_flicker = true,
        -- Recommended for most NVIDIA GPUs
    },
})

hl.config({
    render = {
        ctm_animation = 2,
        direct_scanout = 2,
    },
})
