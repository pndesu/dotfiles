local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.keys = {
  -- Cmd+Delete = delete whole line
  {
    key = 'Backspace',
    mods = 'CMD',
    action = wezterm.action.SendKey { key = 'u', mods = 'CTRL' },
  },
  { key = " ",         mods = "CTRL|SHIFT", action = wezterm.action.ActivateCopyMode },
  -- Translate cmd+hjkl to ctrl+hjkl for tmux/nvim navigation
  {
    key = 'h',
    mods = 'CMD',
    action = wezterm.action.SendKey { key = 'h', mods = 'CTRL' }
  },
  {
    key = 'j',
    mods = 'CMD',
    action = wezterm.action.SendKey { key = 'j', mods = 'CTRL' }
  },
  {
    key = 'k',
    mods = 'CMD',
    action = wezterm.action.SendKey { key = 'k', mods = 'CTRL' }
  },
  {
    key = 'l',
    mods = 'CMD',
    action = wezterm.action.SendKey { key = 'l', mods = 'CTRL' }
  },
  { key = "UpArrow",   mods = "SHIFT",      action = wezterm.action.ScrollToPrompt(-1) },
  { key = "DownArrow", mods = "SHIFT",      action = wezterm.action.ScrollToPrompt(1) },
}
config.window_decorations = "RESIZE"
config.enable_tab_bar = true
return config
