return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "folke/noice.nvim",
  },
  cond = not vim.g.vscode,
  event = { "BufReadPost", "BufNewFile" },
  cmd = "Telescope",
  config = function()
    require("telescope").setup({})
    require("telescope").load_extension("noice")
  end,
}
