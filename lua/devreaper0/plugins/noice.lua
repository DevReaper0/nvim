return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  cond = not vim.g.vscode,
  opts = {
    lsp = {
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
      },
    },
    presets = {
      command_palette = true,       -- Position the cmdline and popupmenu together.
      long_message_to_split = true, -- Long messages will be sent to a split.
    },
  },
}
