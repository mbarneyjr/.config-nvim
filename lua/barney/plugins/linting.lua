return {
  "mfussenegger/nvim-lint",
  lazy = true,
  event = { "BufReadPre", "BufNewFile" }, -- to disable, comment this out
  config = function()
    local lint = require("lint")
    local key = require("barney.lib.keymap")

    -- define github actions file type
    vim.filetype.add({
      extension = {
        jsonl = "json",
      },
      pattern = {
        [".*"] = {
          priority = math.huge,
          function(_, bufnr)
            local path = vim.api.nvim_buf_get_name(bufnr)
            vim.print(path)
            if string.find(path, ".github/") then
              return "yaml.github_actions"
            end
          end,
        },
      },
    })
    lint.linters_by_ft = {
      -- javascript = { "eslint_d" },
      -- typescript = { "eslint_d" },
      ["yaml.cloudformation"] = { "cfn_lint" },
      ["yaml.github_actions"] = { "actionlint" },
    }

    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    local try_lint = function()
      lint.try_lint()
    end

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = try_lint,
    })

    vim.api.nvim_create_user_command("Lint", try_lint, { desc = "Lint the current buffer" })
    key.nmap("<leader>l", try_lint, "[l]int")
  end,
}
