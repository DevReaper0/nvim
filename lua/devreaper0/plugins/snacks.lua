return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  -- stylua: ignore
  keys = {
    { "<leader>e",  function() Snacks.explorer() end,       desc = "File Explorer" },
    { "<leader>ff", function() Snacks.picker.files() end,   desc = "Find Files" },
    { "<leader>fg", function() Snacks.picker.grep() end,    desc = "Grep" },
    { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
    { "<leader>fh", function() Snacks.picker.help() end,    desc = "Help Tags" },
    { "<leader>fu", function() Snacks.picker.undo() end,    desc = "Undo History" },
  },
  ---@type snacks.Config
  opts = {
    dashboard = {
      enabled = not vim.g.vscode,
    },
    explorer = {
      replace_netrw = true,
    },
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
