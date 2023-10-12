return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",
    "zbirenbaum/copilot-cmp",
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    require("luasnip.loaders.from_vscode").lazy_load()

    ---@diagnostic disable-next-line: missing-fields
    cmp.setup({
      ---@diagnostic disable-next-line: missing-fields
      completion = { completeopt = "menu,menuone,preview,noselect" },
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
        ["<c-l>"] = cmp.mapping.confirm({ select = false }),
        ["<C-e>"] = cmp.mapping.close(),
        ["<C-u>"] = cmp.mapping.scroll_docs(-4),
        ["<C-n>"] = cmp.mapping.scroll_docs(4),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "copilot" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
      }),
      ---@diagnostic disable-next-line: missing-fields
      -- window = { completion = { border = "rounded" } },
    })
    require("copilot_cmp").setup()
  end,
}
