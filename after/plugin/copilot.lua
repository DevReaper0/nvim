require('copilot').setup({
  suggestion = {enabled = false},
  panel = {enabled = false},
})
require('copilot_cmp').setup()

vim.api.nvim_set_hl(0, "CmpItemKindCopilot", {fg ="#6CC644"})
