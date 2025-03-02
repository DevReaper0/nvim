return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha",
      show_end_of_buffer = true,
      term_colors = true,
    })

    vim.cmd("colorscheme catppuccin")

    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "FloatTitle", { link = "Title" })
  end,
}
