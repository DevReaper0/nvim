vim.keymap.set("n", "<C-f>", function()
  vim.lsp.buf.format({})
end)
