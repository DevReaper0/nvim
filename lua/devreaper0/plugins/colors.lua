return {
	"EmberwoodTheme/nvim",
	name = "emberwood",
	priority = 1000,
	config = function()
		require("emberwood").setup({
			ctp_options = {
				show_end_of_buffer = true,
				term_colors = true,
				auto_integrations = true,
			},
		})

		vim.cmd("colorscheme emberwood")

		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
		vim.api.nvim_set_hl(0, "FloatTitle", { link = "Title" })
	end,
}
