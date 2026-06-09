---------------------
---- KEYBINDINGS ----
---------------------

local terminal = "kitty"
local mainMod = "SUPER" -- Sets "Windows" key as main modifier

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more

-- open terminal --
hl.bind(mainMod .. " + return", hl.dsp.exec_cmd(terminal))

-- app menu
hl.bind(
	mainMod .. " + D",
	hl.dsp.exec_cmd("rofi -show drun -p -normal-window -x11 -theme ~/.config/hypr/rofi/menu2.rasi")
)

-- kill window --
local closeWindowBind = hl.bind(mainMod .. " + Q", hl.dsp.window.close())

-- wallpaper selector
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("~/.config/hypr/scripts/wallselect.sh"))

-- screenshot --
hl.bind(mainMod .. " + CTRL + S", hl.dsp.exec_cmd("~/.config/hypr/scripts/screenshot.sh"))

-- reload waybar --
hl.bind(mainMod .. "+ CTRL + SHIFT + W", hl.dsp.exec_cmd("~/.config/hypr/scripts/waybar.sh"))

-- logout (quit hyprland)
hl.bind(
	mainMod .. " + M",
	hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")
)

-- window state change --
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit")) -- dwindle only

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("~/.config/hypr/scripts/volume.sh -p"), -- vol up
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("~/.config/hypr/scripts/volume.sh -d"), -- vol down
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("~/.config/hypr/scripts/volume.sh -m"), -- vol mute
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), -- not implemented yet :)
	{ locked = true, repeating = true }
)

-- brightness up
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("~/.config/hypr/scripts/brightness.sh -p"), { locked = true, repeating = true })
-- brightness down
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("~/.config/hypr/scripts/brightness.sh -d"), { locked = true, repeating = true })
