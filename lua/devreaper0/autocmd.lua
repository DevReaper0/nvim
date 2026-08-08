local group = vim.api.nvim_create_augroup("devreaper0", {})

vim.api.nvim_create_autocmd("BufReadPost", {
  group = group,
  pattern = "*",
  desc = "Return to exit position",
  callback = function()
    if vim.fn.line("'\"") > 0 and vim.fn.line("'\"") <= vim.fn.line("$") then
      vim.cmd('normal! g`"zvzz')
    end
  end,
})

vim.api.nvim_create_autocmd("CmdlineEnter", {
  group = group,
  pattern = "/",
  desc = "Highlight all matched strings while typing a search command",
  callback = function()
    vim.cmd("set hlsearch")
  end,
})

vim.api.nvim_create_autocmd("CmdlineLeave", {
  group = group,
  pattern = "/",
  desc = "Highlight all matched strings while typing a search command",
  callback = function()
    vim.cmd("set nohlsearch")
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = group,
  pattern = "lazy",
  desc = "Close Lazy panel with <esc>",
  callback = function()
    vim.keymap.set("n", "<Esc>", function()
      vim.api.nvim_win_close(0, false)
    end, { buffer = true, nowait = true })
  end,
})
