---@param bufnr integer
---@param ... string
---@return string
local function first(bufnr, ...)
	local conform = require("conform")
	for i = 1, select("#", ...) do
		local formatter = select(i, ...)
		if conform.get_formatter_info(formatter, bufnr).available then
			return formatter
		end
	end
	return select(1, ...)
end

return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	keys = {
		{
			"<C-f>",
			function()
				require("conform").format({ async = true })
			end,
			desc = "Format buffer",
		},
	},
	---@module "conform"
	---@type conform.setupOpts
	opts = {
		formatters = {
			biome = {
				require_cwd = true,
			},
		},
		formatters_by_ft = {
			lua = { "stylua" },
			go = function(bufnr)
				return { first(bufnr, "golangci-lint", "gofumpt", "goimports", "gofmt") }
			end,
			python = function(bufnr)
				return {
					first(bufnr, "ruff_fix", "autopep8"),
					first(bufnr, "ruff_format", "black"),
					first(bufnr, "ruff_organize_imports", "isort"),
				}
			end,
			rust = { "rustfmt" },
			bash = { "shfmt", "shellcheck" },
			zsh = { "shfmt", "shellcheck" },
			sh = { "shfmt", "shellcheck" },
			sql = { "sqlfluff" },
			javascript = function(bufnr)
				return { first(bufnr, "biome", "prettierd", "prettier", "eslint") }
			end,
			typescript = function(bufnr)
				return { first(bufnr, "biome", "prettierd", "prettier", "eslint") }
			end,
			javascriptreact = function(bufnr)
				return { first(bufnr, "biome", "prettierd", "prettier", "eslint") }
			end,
			typescriptreact = function(bufnr)
				return { first(bufnr, "biome", "prettierd", "prettier", "eslint") }
			end,
			css = function(bufnr)
				return { first(bufnr, "biome", "prettierd", "prettier", "stylelint") }
			end,
			scss = function(bufnr)
				return { first(bufnr, "biome", "prettierd", "prettier", "stylelint") }
			end,
			html = function(bufnr)
				-- HTML support in Biome isn't ready yet.
				--return { first(bufnr, "biome", "prettierd", "prettier") }
				return { first(bufnr, "prettierd", "prettier") }
			end,
			json = function(bufnr)
				return { first(bufnr, "biome", "prettierd", "prettier", "jsonlint") }
			end,
			jsonc = function(bufnr)
				return { first(bufnr, "biome", "prettierd", "prettier", "jsonlint") }
			end,
			yaml = function(bufnr)
				-- YAML support in Biome isn't ready yet.
				--return { first(bufnr, "biome", "prettierd", "prettier", "yamlfix") }
				return { first(bufnr, "prettierd", "prettier", "yamlfix") }
			end,
			markdown = function(bufnr)
				-- Markdown support in Biome isn't ready yet.
				--return { first(bufnr, "biome", "prettierd", "prettier", "markdownlint") }
				return { first(bufnr, "prettierd", "prettier", "markdownlint") }
			end,
			["*"] = { "injected" },
			["_"] = { "trim_whitespace" },
		},
		default_format_opts = {
			lsp_format = "fallback",
		},
		format_on_save = function(bufnr)
			-- Disable autoformat on certain filetypes
			local ignore_filetypes = {}
			if vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then
				return
			end
			-- Disable with a global or buffer-local variable
			if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
				return
			end
			-- Disable autoformat for files in a certain path
			local bufname = vim.api.nvim_buf_get_name(bufnr)
			if bufname:match("/node_modules/") then
				return
			end
			return { timeout_ms = 500, lsp_format = "fallback" }
		end,
	},
}
