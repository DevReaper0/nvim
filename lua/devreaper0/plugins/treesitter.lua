return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	-- event = { "BufReadPre", "BufNewFile" },
	lazy = false,
	config = function()
		-- require("nvim-treesitter.configs").setup({
		-- 	highlight = {
		-- 		enable = true,
		-- 		additional_vim_regex_highlighting = false,
		-- 	},
		-- 	indent = {
		-- 		enable = true,
		-- 	},
		-- })
		local ts = require("nvim-treesitter")
		local parsers = {
			"lua",
			"go",
			"gomod",
			"gosum",
			"templ",
			"python",
			"rust",
			"c",
			"cmake",
			"make",
			"bash",
			"zsh",
			"sql",
			"html",
			"css",
			"scss",
			"javascript",
			"typescript",
			"jsx",
			"tsx",
			"java",
			"markdown",
			"dockerfile",
			"json",
			"yaml",
			"toml",
			"xml",
			"hyprlang",
			"regex",
			"ssh_config",
			"caddy",
			"tmux",
		}

		for _, parser in ipairs(parsers) do
			ts.install(parser)
		end

		-- Not every tree-sitter parser is the same as the file type detected,
		-- So the patterns need to be registered more cleverly
		local patterns = {}
		for _, parser in ipairs(parsers) do
			local parser_patterns = vim.treesitter.language.get_filetypes(parser)
			for _, pp in pairs(parser_patterns) do
				table.insert(patterns, pp)
			end
		end

		-- vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
		-- vim.wo[0][0].foldmethod = "expr"

		vim.api.nvim_create_autocmd("FileType", {
			pattern = patterns,
			callback = function()
				vim.treesitter.start()
			end,
		})
	end,
}
