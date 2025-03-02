return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    dashboard = { enabled = not vim.g.vscode },
    indent = {
      enabled = not vim.g.vscode,
      indent = {
        only_current = true,
      },
      animate = {
        enabled = false,
      },
    },
    input = { enabled = not vim.g.vscode },
    picker = { enabled = not vim.g.vscode },
    scope = { enabled = true },
  },
}
