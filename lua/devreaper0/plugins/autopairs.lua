return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  opts = {
    disable_filetype = { "TelescopePrompt", "snacks_picker_input" },
    ignored_next_char = "[%w%.]", -- Will ignore alphanumeric and `.` symbol.
  },
}
