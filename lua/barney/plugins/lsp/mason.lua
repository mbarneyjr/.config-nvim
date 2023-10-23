return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    local lspconfig = require("lspconfig")
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local mason_tool_installer = require("mason-tool-installer")

    mason.setup()
    mason_lspconfig.setup({
      ensure_installed = {
        "tsserver",
        "html",
        "cssls",
        "lua_ls",
        "docker_compose_language_service",
        "dockerls",
        "dotls",
        "jsonls",
        "terraformls",
      },
      automatic_installation = true,
    })

    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local lsp_settings = require("barney.lib.lsp_settings")

    local configs = require("lspconfig.configs")

    if not configs["cfn-lsp-extra"] then
      configs["cfn-lsp-extra"] = {
        default_config = {
          cmd = { "cfn-lsp-extra" },
          filetypes = { "yaml.cloudformation", "json.cloudformation" },
          root_dir = function(fname)
            return lspconfig.util.find_git_ancestor(fname)
          end,
          settings = { validate = false },
        },
      }
    end
    lspconfig["cfn-lsp-extra"].setup({})

    mason_lspconfig.setup_handlers({
      function(server_name)
        local default_capabilities = cmp_nvim_lsp.default_capabilities()
        local capabilities = vim.tbl_extend(
          "force",
          default_capabilities,
          lsp_settings[server_name] and lsp_settings[server_name].capabilities or {}
        )
        lspconfig[server_name].setup({
          capabilities = capabilities,
          settings = lsp_settings[server_name] and lsp_settings[server_name].settings,
          on_attach = lsp_settings[server_name] and lsp_settings[server_name].on_attach,
        })
      end,
    })

    mason_tool_installer.setup({
      ensure_installed = {
        "prettier",
        "stylua",
        "eslint-lsp",
        "eslint_d",
      },
    })

    vim.filetype.add({
      pattern = {
        [".*"] = {
          priority = math.huge,
          function(_, bufnr)
            local line1 = vim.filetype.getlines(bufnr, 1)
            local line2 = vim.filetype.getlines(bufnr, 2)
            if vim.filetype.matchregex(line1, [[^AWSTemplateFormatVersion]]) then
              return "yaml.cloudformation"
            elseif
              vim.filetype.matchregex(line1, [[["']AWSTemplateFormatVersion]])
              or vim.filetype.matchregex(line2, [[["']AWSTemplateFormatVersion]])
            then
              return "json.cloudformation"
            end
          end,
        },
      },
    })
  end,
}
