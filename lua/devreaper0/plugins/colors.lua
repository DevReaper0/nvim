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
	end,
}
