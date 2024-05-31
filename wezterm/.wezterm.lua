local wezterm = require 'wezterm'
local config = {}

config.color_scheme = 'nord'
-- config.font = wezterm.font('JetBrainsMonoNL Nerd Font', {weight = 'Regular'})
config.font = wezterm.font('JetBrainsMonoNL Nerd Font', {weight = 'Regular'})
config.default_prog = { 'nu', '-l' }

config.line_height = 1.2

return config
