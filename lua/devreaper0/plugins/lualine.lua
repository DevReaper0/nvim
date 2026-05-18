return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	opts = {
		options = {
			theme = "catppuccin-nvim",
			component_separators = "",
			section_separators = { left = "", right = "" },
			always_divide_middle = true,
		},
		sections = {
			lualine_a = { { "mode", separator = { left = "" }, right_padding = 2 } },
			lualine_b = { "branch", "diff", "diagnostics" },
			lualine_c = { "%=", "filename" },
			lualine_x = {
				"%S",
				{
					"macro",
					fmt = function()
						local reg = vim.fn.reg_recording()
						if reg ~= "" then
							return "Recording @" .. reg
						end
						return nil
					end,
					color = { fg = "#ff9e64" },
					draw_empty = false,
				},
			},
			lualine_y = { "filetype", "progress" },
			lualine_z = {
				{ "location", separator = { right = "" }, left_padding = 2 },
			},
		},
	},
}
