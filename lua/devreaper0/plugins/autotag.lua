return {
	"windwp/nvim-ts-autotag",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
	event = "InsertEnter",
	opts = {
		opts = {
			enable_close = false,
			enable_close_on_slash = true,
		},
	},
}
