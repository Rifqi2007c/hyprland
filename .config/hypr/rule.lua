--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- Example window rules that are useful

local suppressMaximizeRule = hl.window_rule({
	-- Ignore maximize requests from all apps. You'll probably like this.
	name = "suppress-maximize-events",
	match = { class = ".*" },

	suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
	-- Fix some dragging issues with XWayland
	name = "fix-xwayland-drags",
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

-- Hyprland-run windowrule
hl.window_rule({
	name = "move-hyprland-run",
	match = { class = "hyprland-run" },

	move = "20 monitor_h-120",
	float = true,
})

hl.window_rule({ match = { class = "kitty" }, opacity = 0.94 })
hl.window_rule({ match = { class = "obsidian" }, opacity = 0.96 })
hl.window_rule({ match = { class = "spotify" }, opacity = 0.90 })
hl.window_rule({ match = { class = "steam" }, opacity = 0.90 })
hl.window_rule({ match = { class = "discord" }, opacity = 0.90 })

hl.window_rule({
	name = "drun",
	match = {
		class = "Rofi",
	},
	float = 1,
	pin = 1,
	opacity = 0.84,
	animation = "slide down",
})

hl.window_rule({
	name = "powermenu",
	match = {
		class = "Rofi",
		title = "rofi - power",
	},
	float = 1,
	pin = 1,
	opacity = 0.84,
	animation = "slide down",
})

hl.window_rule({
	name = "wallselect",
	match = {
		class = "Rofi",
		title = "rofi - wal",
	},
	float = 1,
	pin = 1,
	opacity = 0.84,
	animation = "gnome",
})

-- Layer rule --
hl.layer_rule({
	match = { namespace = "swaync-control-center" },
	blur = true,
	ignore_alpha = 0.5,
	animation = "slide right",
})

hl.layer_rule({
	match = { namespace = "swaync-notification-window" },
	blur = true,
	ignore_alpha = 0.5,
	animation = "slide right",
})
