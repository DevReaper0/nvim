require("devreaper0.options")
require("devreaper0.remap")

require("devreaper0.lazy")

-- Return to exit position
local augroup = vim.api.nvim_create_augroup('line_return', { clear = true })
vim.api.nvim_create_autocmd('BufReadPost', {
  pattern = '*',
  group = augroup,
  callback = function()
    if vim.fn.line("'\"") > 0 and vim.fn.line("'\"") <= vim.fn.line("$") then
      vim.fn.execute('normal! g`"zvzz', false)
    end
  end
})
