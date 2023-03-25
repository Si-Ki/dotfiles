local wezterm = require 'wezterm'

local dark_theme = ({
    'Oxocarbon Dark', -- [1],
    'nord', -- [2]
    'Catppuccin Mocha', -- [3]
    'Batman' -- [4]
})[1]

return {
  color_scheme = dark_theme,
  use_fancy_tab_bar = false,
  window_decorations = "RESIZE",
  hide_tab_bar_if_only_one_tab = true,
}
