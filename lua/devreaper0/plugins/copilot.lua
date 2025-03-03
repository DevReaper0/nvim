return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false },
      filetypes = {
        markdown = true,
        help = true,
      },
    },
  },
  {
    "fang2hou/blink-copilot",
    lazy = true,
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "zbirenbaum/copilot.lua",
    },
    build = vim.loop.os_uname().sysname ~= "Windows_NT" and "make tiktoken" or false,
    cond = not vim.g.vscode,
    cmd = { "CopilotChat", "CopilotChatToggle", "CopilotChatOpen" },
    event = { "BufReadPost", "BufNewFile" },
    opts = {},
  },
}
