return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")
    local key = require("barney.lib.keymap")
    conform.setup({
      formatters_by_ft = {
        lua = { "stylua" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        markdown = { "prettier" },
        terraform = { "terraform_fmt" },
        ["*"] = { "hrim_whitespace" },
      },

      format_on_save = {
        -- These options will be passed to conform.format()
        -- async = false,
        timeout_ms = 500,
        lsp_fallback = true,
      },
    })

    local format = function()
      conform.format({
        lsp_fallback = true,
        -- async = false,
        timeout_ms = 500,
      })
    end
    key.nmap("<c-f>", format, "[f]ormat code")
    key.vmap("<c-f>", format, "[f]ormat code")
  end,
}
