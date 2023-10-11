return {
  lua_ls = {
    settings = {
      Lua = {
        workspace = { checkThirdParty = false },
        telemetry = { enable = false },
        completion = { callSnippet = "Replace" },
      },
    },
  },
  tsserver = {
    settings = {
      diagnostics = {
        ignoredCodes = {
          -- ignore "All imports are unused"
          6192,
        },
      },
    },
    on_attach = function(client)
      client.server_capabilities.documentFormattingProvider = false
    end,
  },
}
