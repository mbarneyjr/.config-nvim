return {
  "zbirenbaum/copilot.lua",
  config = function()
    require("copilot").setup({
      panel = {
        enabled = false,
      },
      suggestion = {
        enabled = true,
        auto_trigger = true,
        debounce = 75,
        keymap = {
          accept = "<c-j>",
          accept_word = false,
          accept_line = false,
          next = "<tab>",
          prev = "<s-tab>",
          dismiss = "<c-f>",
        },
      },
      filetypes = {
        ["*"] = true,
      },
      copilot_node_command = "node", -- Node.js version must be > 16.x
      server_opts_overrides = {},
    })
  end,
}
