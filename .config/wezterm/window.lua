local use_background_image = true

local padding = 7
local window_padding = {
    left = padding,
    right = padding,
    top = padding,
    bottom = padding
}

local M = {
    window_padding = window_padding,
    window_background_image_hsb = {brightness = 0.3},
    window_decorations = 'RESIZE',
    window_close_confirmation = 'NeverPrompt',
    adjust_window_size_when_changing_font_size = false
}

if use_background_image then
    M.window_background_image = '/home/siki/.config/wezterm/bg/nasa.png'
end

return M
