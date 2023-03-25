local wezterm = require 'wezterm'

local font_size = 11
local bold = false
local font_family = ({
  'JetBrainsMono Nerd Font', -- [1]
  'BlexMono Nerd Font', -- [2]
  'Liga SFMono Nerd Font', -- [3]
  'Iosevka Nerd Font Mono', -- [4]
  'FiraCode Nerd Font Mono', -- [5]
  'ComicCodeLigatures', -- [6]
  'Nouveau IBM', -- [7]
  'IBM Plex Mono' -- [8]
})[1]

local options = {}
if bold then options['weight'] = 'Bold' end

local font = wezterm.font(font_family, options)

return {font = font, font_size = font_size}
