local wezterm = require("wezterm")
local mux = wezterm.mux
local act = wezterm.action
local config = {}
local keys = {}
local mouse_bindings = {}
local launch_menu = {}
local haswork, work = pcall(require, "work")

--- Setup PowerShell options
if wezterm.target_triple == "x86_64-pc-windows-msvc" then
    --- Grab the ver info for later use.
    local success, stdout, stderr = wezterm.run_child_process({ "cmd.exe", "ver" })
    local major, minor, build, rev = stdout:match("Version ([0-9]+)%.([0-9]+)%.([0-9]+)%.([0-9]+)")
    local is_windows_11 = tonumber(build) >= 22000

    --- Set wsl as the default on Windows
    config.default_prog = { "wsl.exe" }
    table.insert(launch_menu, {
        label = "WSL",
        args = { "wsl.exe" },
    })
    table.insert(launch_menu, {
        label = "PowerShell",
        args = { "powershell.exe", "-NoLogo" },
    })
    table.insert(launch_menu, {
        label = "PowerShell No Profile",
        args = { "powershell.exe", "-NoLogo", "-NoProfile" },
    })
    table.insert(launch_menu, {
        label = "CMD",
        args = { "cmd.exe" },
    })
else
    --- Non-Windows Machinu
    table.insert(launch_menu, {
        label = "Pwsh",
        args = { "/usr/local/bin/pwsh", "-NoLogo" },
    })
    table.insert(launch_menu, {
        label = "Pwsh No Profile",
        args = { "/usr/local/bin/pwsh", "-NoLogo", "-NoProfile" },
    })
end

-- Mousing bindings
mouse_bindings = {
    -- Change the default click behavior so that it only selects
    -- text and doesn't open hyperlinks
    {
        event = { Up = { streak = 1, button = "Left" } },
        mods = "NONE",
        action = act.CompleteSelection("ClipboardAndPrimarySelection"),
    },

    -- and make CTRL-Click open hyperlinks
    {
        event = { Up = { streak = 1, button = "Left" } },
        mods = "CTRL",
        action = act.OpenLinkAtMouseCursor,
    },
    {
        event = { Down = { streak = 3, button = "Left" } },
        action = wezterm.action.SelectTextAtMouseCursor("SemanticZone"),
        mods = "NONE",
    },
    {
		event = { Down = { streak = 1, button = "Right" } },
		mods = "NONE",
		action = wezterm.action_callback(function(window, pane)
			local has_selection = window:get_selection_text_for_pane(pane) ~= ""
			if has_selection then
				window:perform_action(act.CopyTo("ClipboardAndPrimarySelection"), pane)
				window:perform_action(act.ClearSelection, pane)
			else
				window:perform_action(act({ PasteFrom = "Clipboard" }), pane)
			end
		end),
	},
}

--- Default config settings
config.scrollback_lines = 7000
config.hyperlink_rules = wezterm.default_hyperlink_rules()
config.hide_tab_bar_if_only_one_tab = true
config.color_scheme = "NightOwl (Gogh)"
config.font = wezterm.font_with_fallback({
    {
        family = "PragmataPro",
    },
    {
        family = "JetBrains Mono", },
})
config.font_size = 10
config.launch_menu = launch_menu
config.default_cursor_style = "SteadyBar"
config.automatically_reload_config = true
config.window_close_confirmation = "NeverPrompt"
config.adjust_window_size_when_changing_font_size = false
config.window_decorations = "RESIZE"
config.use_fancy_tab_bar = true
config.tab_bar_at_bottom = false
config.mouse_bindings = mouse_bindings
config.warn_about_missing_glyphs = false
config.window_padding = {
    left = 16,
    right = 16,
    top = 16,
    bottom = 0,
}

-- Allow overwriting for work stuff
if haswork then
    work.apply_to_config(config)
end

return config
