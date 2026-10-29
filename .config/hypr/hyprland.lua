-- ~/.config/hypr/hyprland.lua

-- #################
-- ### MONITORS ####
-- #################}

hl.monitor({
	output = "",
	mode = "preferred",
	position = "auto",
	scale = "1.07",
})

hl.config({
	ecosystem = {
		no_update_news = true,
	},
})

-- ###################
-- ### MY PROGRAMS ###
-- ###################
local terminal = "kitty"
local vol = "pamixer --get-volume"
local mainMod = "SUPER"

-- #################
-- ### AUTOSTART ###
-- #################
hl.on("hyprland.start", function()
	hl.exec_cmd("swaync")
	hl.exec_cmd("sleep 1 && hyprpaper")
	hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
	hl.exec_cmd(
		"bash -c 'sleep 1 && eww open bar_widget && eww update get_vol=\"$("
			.. vol
			.. ")\" && ~/.config/eww/scripts/getvol.sh'"
	)
	hl.exec_cmd("bash -c '~/.config/eww/scripts/workspace.sh'")
	hl.exec_cmd("bash -c 'flatpak run org.waywallen.waywallen --no-ui &'")
	hl.exec_cmd("sleep 4 && waywallen-layer-shell &")
	-- hl.exec_cmd("waywallen --daemon")
	hl.exec_cmd("hypridle")
	hl.exec_cmd("sh ~/.config/hypr/scripts/text_animation/anitext.sh")
	hl.exec_cmd("sh ~/.config/hypr/scripts/weather/weather.sh")
	hl.exec_cmd("bash -c 'sleep 1 && elephant'")
end)

-- #############################
-- ### ENVIRONMENT VARIABLES ###
-- #############################
hl.env("XCURSOR_THEME", "Frieren-Winter")
hl.env("XCURSOR_SIZE", "32")
hl.env("HYPRCURSOR_SIZE", "32")
hl.env(
	"XCURSOR_PATH",
	"/usr/share/icons:/home/" .. os.getenv("USER") .. "/.icons:/home/" .. os.getenv("USER") .. "/.local/share/icons"
)
hl.env("HYPRCURSOR_MOVE", "fleur")

-- #####################
-- ### LOOK AND FEEL ###
-- #####################
hl.config({
	general = {
		gaps_in = 5,
		gaps_out = 12,
		border_size = 3,
		["col.active_border"] = "rgba(203,166,247,0.68)",
		["col.inactive_border"] = "rgba(0,0,0,0)",
		resize_on_border = true,
		allow_tearing = false,
		layout = "dwindle",
	},
	decoration = {
		rounding = 10,
		rounding_power = 2,
		active_opacity = 1.0,
		inactive_opacity = 0.97,
		shadow = {
			enabled = true,
			range = 40,
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
		bezier = {
			{ "easeOutQuint", 0.23, 1, 0.32, 1 },
			{ "easeInOutCubic", 0.65, 0.05, 0.36, 1 },
			{ "linear", 0, 0, 1, 1 },
			{ "almostLinear", 0.5, 0.5, 0.75, 1.0 },
			{ "quick", 0.15, 0, 0.1, 1 },
		},
		animation = {
			{ "global", 1, 10, "default" },
			{ "border", 1, 5.39, "easeOutQuint" },
			{ "windows", 1, 4.79, "easeOutQuint" },
			{ "windowsIn", 1, 4.1, "easeOutQuint", "popin 87%" },
			{ "windowsOut", 1, 1.49, "linear", "popin 87%" },
			{ "fadeIn", 1, 1.73, "almostLinear" },
			{ "fadeOut", 1, 1.46, "almostLinear" },
			{ "fade", 1, 3.03, "quick" },
			{ "layers", 1, 3.81, "easeOutQuint" },
			{ "layersIn", 1, 4, "easeOutQuint", "fade" },
			{ "layersOut", 1, 1.5, "linear", "fade" },
			{ "fadeLayersIn", 1, 1.79, "almostLinear" },
			{ "fadeLayersOut", 1, 1.39, "almostLinear" },
			{ "workspaces", 1, 3, "easeOutQuint", "slide" },
			{ "workspacesIn", 1, 3, "easeOutQuint", "slide" },
			{ "workspacesOut", 1, 3, "easeOutQuint", "slide" },
		},
	},
	dwindle = {
		preserve_split = true,
	},
	master = {
		new_status = "master",
	},
	misc = {
		force_default_wallpaper = 1,
		disable_hyprland_logo = true,
	},
})

-- #############
-- ### INPUT ###
-- #############
hl.config({
	input = {
		kb_layout = "latam,us",
		kb_variant = "",
		kb_model = "",
		kb_options = "",
		kb_rules = "",
		follow_mouse = 1,
		sensitivity = 0,
		touchpad = {
			natural_scroll = true,
		},
	},
	device = {
		{
			name = "epic-mouse-v1",
			sensitivity = -0.5,
		},
	},
})

hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace",
})

-- ###################
-- ### KEYBINDINGS ###
-- ###################

-- Aplicaciones y utilidades
hl.bind(mainMod .. " + SHIFT + n", hl.dsp.exec_cmd("swaync-client -t -sw"))
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + W", hl.dsp.window.float())
hl.bind(
	mainMod .. " + SHIFT + S",
	hl.dsp.exec_cmd([[grim -g "$(slurp)" ~/Pictures/Screenshots/captura_$(date +'%Y-%m-%d_%H-%M-%S').png]])
)
hl.bind(mainMod .. " + E", hl.dsp.window.close())
hl.bind(mainMod .. " + M", hl.dsp.exit())
hl.bind(mainMod .. " + F", hl.dsp.exec_cmd("nautilus --new-window"))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))

-- Walker & Eww
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd("walker"))
hl.bind(mainMod .. " + A", hl.dsp.exec_cmd("eww open usrctl && eww update ctlrev=true"))

-- Navegación de ventanas (usando la tabla de dirección o focus)
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "l" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "r" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "u" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "d" }))

-- Espacios de trabajo (Bucle optimizado para 1 al 6)
for i = 1, 6 do
	hl.bind(mainMod .. " + " .. tostring(i), hl.dsp.focus({ workspace = tostring(i) }))
	hl.bind(mainMod .. " + SHIFT + " .. tostring(i), hl.dsp.window.move({ workspace = tostring(i) }))
end
hl.bind(mainMod .. " + 0", hl.dsp.focus({ workspace = "10" }))
hl.bind(mainMod .. " + SHIFT + 0", hl.dsp.window.move({ workspace = "10" }))

-- Espacio de trabajo especial (scratchpad)
hl.bind(mainMod .. " + CTRL + A", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + A", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll de espacios de trabajo
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Redimensionar y mover con el ratón (bindm equivalentes)
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag())
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize())

-- Teclas multimedia
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"))
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"))
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s 10%+"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 10%-"))

hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"))
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"))

-- ##############################
-- ### WINDOWS AND WORKSPACES ###
-- ##############################

hl.window_rule({
	match = { class = ".*" },
	suppress_event = "maximize",
})
hl.window_rule({
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},
	no_focus = true,
})
