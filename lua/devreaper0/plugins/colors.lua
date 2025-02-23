return {
  {
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
    end
  }
}
