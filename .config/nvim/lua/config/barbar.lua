local M = {}

function M.setup()
  local status_ok, barbar = pcall(require, "bufferline")
  if not status_ok then
    return
  end

barbar.setup {
  animation = false,
  auto_hide = true,
  tabpages = true,
  closable = false,
  clickable = true,
  exclude_ft = {'javascript'},
  exclude_name = {'package.json'},
  icons = true,
  icon_custom_colors = false,
  icon_separator_active = '',
  icon_separator_inactive = '',
  icon_close_tab = '',
  icon_close_tab_modified = '●',
  icon_pinned = '車',
  insert_at_end = false,
  insert_at_start = false,
  maximum_padding = 1,
  minimum_padding = 1,
  maximum_length = 30,
  semantic_letters = true,
  letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',
  no_name_title = nil,
}

end
return M
