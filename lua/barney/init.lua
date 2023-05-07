for _, source in ipairs {
  'barney.packer',
  'barney.neoconf',
  'barney.remap',
  'barney.set',
  'barney.which-key',
  'barney.completion',
  'barney.lsp',
  'barney.treesitter',
  'barney.colorscheme',
  'barney.lualine',
  'barney.telescope',
  'barney.harpoon',
  'barney.undotree',
  'barney.gitsigns',
  'barney.trouble',
  'barney.copilot',
  'barney.toggleterm',
  'barney.neo-tree',
  'barney.dap',
  'barney.comment',
  'barney.autocommand',
  'barney.scratch',
} do
  local status_ok, fault = pcall(require, source)
  if not status_ok then vim.api.nvim_err_writeln("Failed to load " .. source .. "\n\n" .. fault) end
end
