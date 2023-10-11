return {
  "folke/neodev.nvim",
  config = function()
    require("neodev").setup({
      library = { types = true },
    })
  end,
}
