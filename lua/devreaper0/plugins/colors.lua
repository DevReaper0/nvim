return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		local catppuccin = require("catppuccin")
		catppuccin.flavours = { latte = 1, frappe = 2, macchiato = 3, mocha = 4, matrix = 5 }
		catppuccin.setup({
			flavour = "matrix",
			show_end_of_buffer = true,
			term_colors = true,
			auto_integrations = true,
		})

		vim.cmd("colorscheme catppuccin-nvim")

		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
		vim.api.nvim_set_hl(0, "FloatTitle", { link = "Title" })
	end,
}
