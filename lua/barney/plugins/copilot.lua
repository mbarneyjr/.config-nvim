return {
  "zbirenbaum/copilot.lua",
  config = function()
    require("copilot").setup({
      panel = { enabled = false },
      suggestion = { enabled = false },
      filetypes = {
        ["*"] = true,
      },
      copilot_node_command = "node", -- Node.js version must be > 16.x
      server_opts_overrides = {},
    })
  end,
}
