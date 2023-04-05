vim.g.autorun_window = vim.g.autorun_window or -1
vim.g.autorun_bufnr = vim.g.autorun_bufnr or -1

local function log(_, data)
  if data then
    vim.api.nvim_buf_set_lines(vim.g.autorun_bufnr, -1, -1, false, data)
  end
end

local function open_buffer()
  local current_window = vim.api.nvim_get_current_win()
  vim.cmd('vsplit')
  vim.g.autorun_window = vim.api.nvim_get_current_win()
  vim.g.autorun_bufnr = vim.api.nvim_create_buf(true, true)
  vim.api.nvim_win_set_buf(vim.g.autorun_window, vim.g.autorun_bufnr)
  vim.api.nvim_set_current_win(current_window)
end

local function close_buffer()
  vim.api.nvim_buf_delete(vim.g.autorun_bufnr, { force = true })
  vim.g.autorun_bufnr = -1
  vim.g.autorun_window = -1
end

local function create_autocmd(pattern, cmd)
  vim.api.nvim_create_autocmd('BufWritePost', {
    group = vim.api.nvim_create_augroup('AutoRun', { clear = true }),
    pattern = pattern,
    callback = function()
      vim.api.nvim_buf_set_lines(vim.g.autorun_bufnr, 0, -1, false, { "$ " .. cmd })
      local job_id = vim.fn.jobstart(cmd, {
        stdout_buffered = true,
        on_stdout = log,
        on_stderr = log,
      })
      vim.fn.jobwait({ job_id }, 0)
    end,
  })
end

local autorun = function(args)
  if vim.g.autorun_bufnr == -1 or vim.g.autorun_window == -1 then
    open_buffer()
    create_autocmd(vim.fn.expand('%'), args.args)
  else
    close_buffer()
    vim.api.nvim_del_augroup_by_name('AutoRun')
  end
end

local function autorun_prompt()
  local cmd = vim.fn.input('Command: ')
  if cmd ~= '' then
    autorun({ args = cmd })
  end
end

vim.api.nvim_create_user_command('AutoRun', autorun, { nargs = '?' })
vim.keymap.set('n', '<leader>ar', autorun_prompt, { silent = true })
vim.keymap.set('n', '<leader>aR', autorun, { silent = true })

