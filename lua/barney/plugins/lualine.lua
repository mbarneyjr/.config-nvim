return {
  "nvim-lualine/lualine.nvim",
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status")

    lualine.setup({
      options = {
        icons_enabled = false,
        component_separators = "|",
        section_separators = "",
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch" },
        lualine_c = { { "filename", path = 1, file_status = true } },
        lualine_x = {
          { lazy_status.updates, cond = lazy_status.has_updates },
          { "encoding" },
          { "fileformat" },
        },
        lualine_y = { "filetype" },
      },
    })
  end,
}
