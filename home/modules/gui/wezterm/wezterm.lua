local wezterm = require("wezterm")

local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
  -- Launch NixOS WSL
  config.default_domain = 'WSL:NixOS'

  -- Use Git bash instead WSL
  -- config.default_prog = { "C:\\Program Files\\Git\\bin\\bash.exe", "--login", "-i" }

  config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
  config.integrated_title_button_style = "Windows"
else
  -- Might need to handle MacOS, but I don't own one...
  config.hide_tab_bar_if_only_one_tab = true
end

config.color_scheme = "Kanagawa (Gogh)"
config.use_fancy_tab_bar = false

config.window_padding = {
  left = 5,
  right = 5,
  top = 5,
  bottom = 5,
}

config.window_background_opacity = 0.95
config.font = wezterm.font("FiraCode Nerd Font")
config.font_size = 12

return config
