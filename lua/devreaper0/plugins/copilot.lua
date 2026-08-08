return {
  {
    "zbirenbaum/copilot.lua",
    cond = not vim.g.vscode,
    event = "InsertEnter",
    cmd = "Copilot",
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
    event = { "BufReadPost", "BufNewFile" },
    cmd = {
      "CopilotChat",
      "CopilotChatAgents",
      "CopilotChatCommit",
      "CopilotChatDocs",
      "CopilotChatExplain",
      "CopilotChatFix",
      "CopilotChatLoad",
      "CopilotChatModels",
      "CopilotChatOpen",
      "CopilotChatOptimize",
      "CopilotChatPrompts",
      "CopilotChatReview",
      "CopilotChatTests",
      "CopilotChatToggle",
    },
    opts = {},
  },
}
