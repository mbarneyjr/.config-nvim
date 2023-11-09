return {
  "mfussenegger/nvim-lint",
  lazy = true,
  event = { "BufReadPre", "BufNewFile" }, -- to disable, comment this out
  config = function()
    local lint = require("lint")
    local key = require("barney.lib.keymap")

    lint.linters_by_ft = {
      -- javascript = { "eslint_d" },
      -- typescript = { "eslint_d" },
      ["yaml.cloudformation"] = { "cfn_lint" },
      yaml = { "actionlint" },
    }

    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    local try_lint = function()
      lint.try_lint()
    end

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = try_lint,
    })

    key.nmap("<leader>l", try_lint, "[l]int")
  end,
}
