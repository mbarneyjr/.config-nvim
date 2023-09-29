return {
  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
  tsserver = {
    diagnostics = {
      ignoredCodes = {
        6192,
      },
    },
  },
}
