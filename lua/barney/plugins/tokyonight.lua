return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = { style = "night" },
  config = function()
    require("tokyonight").setup({
      styles = {
        -- Style to be applied to different syntax groups
        -- Value is any valid attr-list value for `:help nvim_set_hl`
        comments = { italic = true },
        keywords = { italic = true },
        functions = {},
        variables = {},
        -- Background styles. Can be "dark", "transparent" or "normal"
        sidebars = "dark", -- style for sidebars, see below
        floats = "dark", -- style for floating windows
      },
      dim_inactive = true, -- dims inactive windows
      lualine_bold = true, -- When `true`, section headers in the lualine theme will be bold
    })
    vim.cmd.colorscheme("tokyonight")
  end,
}
