require('lualine').setup({
  options = {
    icons_enabled = false,
    theme = 'auto',
    component_separators = '|',
    section_separators = '',
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', },
    lualine_c = { { 'filename', path = 1, file_status = true  } },
    lualine_x = { 'filetype' },
  }
})
