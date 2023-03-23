local function awsume_region()
  return os.getenv('AWS_REGION') or ''
end

local function awsume_profile()
  return os.getenv('AWSUME_PROFILE') or ''
end

require('lualine').setup({
  options = {
    icons_enabled = false,
    theme = 'codedark',
    component_separators = '|',
    section_separators = '',
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', },
    lualine_c = { 'filename' },
    lualine_x = { 'diagnostics' },
    lualine_y = { awsume_region },
    lualine_z = { awsume_profile },
  }
})
