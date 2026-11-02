-- Hyprland config (Lua). Ported from hyprland.conf, hyprland-bindings.conf
-- and hyprland-autostart.conf. Wiki: https://wiki.hypr.land/configuring/

------------------
---- MONITORS ----
------------------

hl.monitor({ output = "eDP-1", mode = "preferred",      position = "0x0",     scale = "auto" })
hl.monitor({ output = "DP-1",  mode = "1920x1080@144",  position = "-1920x0", scale = "auto" })


---------------------
---- MY PROGRAMS ----
---------------------

local mainMod     = "SUPER"
local terminal    = "kitty"
local menu        = "~/.config/rofi/launchers/type-1/launcher.sh"
local fileManager = 'kitty -e zsh -c "y"'


-------------------
---- AUTOSTART ----
-------------------

hl.on("hyprland.start", function()
    hl.exec_cmd("waybar")
    hl.exec_cmd(terminal)
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("swaync")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("setxkbmap -layout us,hu -option 'grp:alt_shift_toggle'")
    hl.exec_cmd("greenclip daemon")
    hl.exec_cmd("nm-applet")
end)


-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

hl.env("HYPRCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_THEME", "rose-pine-hyprcursor")

hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")
hl.env("_JAVA_AWT_WM_NONEREPARENTING", "1")
hl.env("HYPRSHOT_DIR", "Pictures/Screenshots")


-----------------------
---- LOOK AND FEEL ----
-----------------------

-- colors: bright purple #EE34D5, dark purple #830EE3, redish pinkish #E30E67
hl.config({
    general = {
        gaps_in  = 5,
        gaps_out = 10,

        border_size = 2,

        col = {
            active_border   = { colors = { "rgba(ee34d5ee)", "rgba(830ee3ee)" }, angle = 45 },
            inactive_border = "rgba(595959aa)",
        },

        resize_on_border = false,
        allow_tearing    = false,
        layout           = "dwindle",
    },

    decoration = {
        rounding = 10,

        active_opacity   = 1.0,
        inactive_opacity = 1.0,

        blur = {
            enabled  = false,
            size     = 3,
            passes   = 1,
            vibrancy = 0.1696,
        },
    },

    animations = {
        enabled = false,
    },

    dwindle = {
        preserve_split = true,
    },

    master = {
        new_status = "master",
    },

    misc = {
        force_default_wallpaper = -1,
        disable_hyprland_logo   = false,
    },
})


---------------
---- INPUT ----
---------------

hl.config({
    input = {
        kb_layout  = "us,hu",
        kb_variant = "",
        kb_model   = "",
        kb_options = "grp:ctrl_alt_toggle",
        kb_rules   = "",

        follow_mouse = 0,
        sensitivity  = 0,

        touchpad = {
            natural_scroll          = false,
            middle_button_emulation = true,
        },
    },
})


---------------------
---- KEYBINDINGS ----
---------------------

local function bind(keys, action, flags)
    hl.bind(keys, action, flags)
end

-- Custom
bind(mainMod .. " + R", hl.dsp.exec_cmd("~/.config/waybar/reload.sh"))        -- restart waybar

-- Screenshots
bind("Print",                    hl.dsp.exec_cmd("hyprshot -m region --clipboard-only"))
bind("SHIFT + Print",            hl.dsp.exec_cmd("hyprshot -m window --clipboard-only"))
bind("CONTROL + Print",          hl.dsp.exec_cmd("hyprshot -m region"))
bind("CONTROL + SHIFT + Print",  hl.dsp.exec_cmd("hyprshot -m window"))

bind(mainMod .. " + SHIFT + L",  hl.dsp.exec_cmd("hyprlock"))
bind(mainMod .. " + N",          hl.dsp.exec_cmd("swaync-client -t --sw"))

bind(mainMod .. " + SHIFT + Return", hl.dsp.exec_cmd(terminal))
bind(mainMod .. " + SHIFT + C",      hl.dsp.window.close())
bind(mainMod .. " + SHIFT + Q",      hl.dsp.exec_cmd("~/.config/rofi/powermenu/type-2/powermenu.sh"))
bind(mainMod .. " + E",              hl.dsp.exec_cmd(fileManager))
bind(mainMod .. " + F",              hl.dsp.window.float({ action = "toggle" }))
bind(mainMod .. " + Space",          hl.dsp.exec_cmd(menu))
bind(mainMod .. " + SHIFT + F",      hl.dsp.window.fullscreen({ mode = "fullscreen" }))

-- Focus / resize / move with arrows or HJKL
local dirs = {
    { arrow = "left",  vim = "H", x = -50, y = 0   },
    { arrow = "right", vim = "L", x = 50,  y = 0   },
    { arrow = "up",    vim = "K", x = 0,   y = -50 },
    { arrow = "down",  vim = "J", x = 0,   y = 50  },
}
for _, d in ipairs(dirs) do
    for _, key in ipairs({ d.arrow, d.vim }) do
        bind(mainMod .. " + " .. key,           hl.dsp.focus({ direction = d.arrow }))
        bind(mainMod .. " + SHIFT + " .. key,   hl.dsp.window.resize({ x = d.x, y = d.y, relative = true }))
        bind(mainMod .. " + ALT + " .. key,     hl.dsp.window.move({ direction = d.arrow }))
    end
end

-- Workspaces 1-10 (key 0 = workspace 10)
for i = 1, 10 do
    local key = i % 10
    bind(mainMod .. " + " .. key,         hl.dsp.focus({ workspace = i }))
    bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

bind(mainMod .. " + Tab", hl.dsp.focus({ last = true }))

-- Move current workspace to monitor 0/1/2
for i = 1, 3 do
    bind(mainMod .. " + CONTROL + " .. i, hl.dsp.workspace.move({ monitor = tostring(i - 1) }))
end

-- Scroll through existing workspaces
bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with LMB/RMB drag
bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Volume / brightness (repeat while held, work when locked)
local held = { locked = true, repeating = true }
bind("XF86AudioRaiseVolume",         hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ +10%"), held)
bind("SHIFT + XF86AudioRaiseVolume", hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ +1%"),  held)
bind("XF86AudioLowerVolume",         hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ -10%"), held)
bind("SHIFT + XF86AudioLowerVolume", hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ -1%"),  held)
bind("XF86AudioMute",                hl.dsp.exec_cmd("pactl set-sink-mute @DEFAULT_SINK@ toggle"), held)
bind(mainMod .. " + M",              hl.dsp.exec_cmd("pactl set-sink-mute @DEFAULT_SINK@ toggle"), held)
bind("XF86AudioMicMute",             hl.dsp.exec_cmd("pactl set-source-mute @DEFAULT_SOURCE@ toggle"), held)
bind("XF86MonBrightnessUp",          hl.dsp.exec_cmd("brightnessctl s 10%+"), held)
bind("XF86MonBrightnessDown",        hl.dsp.exec_cmd("brightnessctl s 10%-"), held)

-- Media keys (requires playerctl)
local locked = { locked = true }
bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       locked)
bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), locked)
bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), locked)
bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   locked)


--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

hl.window_rule({
    name  = "suppress-maximize-events",
    match = { class = ".*" },
    suppress_event = "maximize",
})

hl.window_rule({
    name  = "idle-inhibit-fullscreen",
    match = { class = ".*" },
    idle_inhibit = "fullscreen",
})

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },
    no_focus = true,
})
