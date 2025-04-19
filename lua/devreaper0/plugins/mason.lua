return {
	{
		"williamboman/mason.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = {
			"williamboman/mason.nvim",
		},
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			ensure_installed = {
				"biome",
				"prettierd", -- For everything not yet supported by Biome
				-- "harper_ls",

				"lua_ls",
				"stylua",

				"gopls",
				"golangci-lint",
				"gofumpt",

				"pylsp",
				"ruff",

				"rust_analyzer",

				"bashls",
				"shfmt",
				"shellcheck",

				"sqlfluff",

				"emmet_ls",
				"html",
				"tailwindcss",
				"cssls",
				"stylelint",
				"ts_ls",
				"denols",

				"jsonls",
				"yamlls",
				"lemminx",

				"marksman",
				"markdownlint",

				"dockerls",

				"clangd",

				"arduino_language_server",

				"jdtls",
			},
		},
	},
}
