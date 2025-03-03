return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "debugloop/telescope-undo.nvim",
    "folke/noice.nvim",
  },
  cond = not vim.g.vscode,
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    require("telescope").setup({})
    require("telescope").load_extension("undo")
    require("telescope").load_extension("noice")
  end,
}
