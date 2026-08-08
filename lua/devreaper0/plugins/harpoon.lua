return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "folke/snacks.nvim",
  },
  cond = not vim.g.vscode,
  event = "VeryLazy",
  config = function()
    local harpoon = require("harpoon")

    harpoon:setup()

    local function generate_harpoon_picker()
      local file_paths = {}
      for _, item in ipairs(harpoon:list().items) do
        table.insert(file_paths, {
          text = item.value,
          file = item.value,
        })
      end
      return file_paths
    end

    local function toggle_snacks_picker(harpoon_files)
      Snacks.picker({
        finder = generate_harpoon_picker,
        win = {
          input = {
            keys = {
              ["<C-e>"] = { "close", mode = { "n", "i" } },
              ["dd"] = { "harpoon_delete", mode = { "n", "x" } },
            },
          },
          list = {
            keys = {
              ["<C-e>"] = { "close", mode = { "n", "i" } },
              ["dd"] = { "harpoon_delete", mode = { "n", "x" } },
            },
          },
        },
        actions = {
          harpoon_delete = function(picker, item)
            local to_remove = item or picker:selected()
            table.remove(harpoon:list().items, to_remove.idx)
            picker:find({
              refresh = true,
            })
          end,
        },
      })
    end

    -- stylua: ignore start
    vim.keymap.set("n", "<C-e>", function() toggle_snacks_picker(harpoon:list()) end, { desc = "Open harpoon window" })
    -- vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Open harpoon window" })

    vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end, { desc = "Add buffer to harpoon" })
    vim.keymap.set("n", "<leader>r", function() harpoon:list():remove() end, { desc = "Remove buffer from harpoon" })

    vim.keymap.set("n", "<leader>ha", function() harpoon:list():select(1) end, { desc = "Select harpoon buffer 1" })
    vim.keymap.set("n", "<leader>hs", function() harpoon:list():select(2) end, { desc = "Select harpoon buffer 2" })
    vim.keymap.set("n", "<leader>hd", function() harpoon:list():select(3) end, { desc = "Select harpoon buffer 3" })
    vim.keymap.set("n", "<leader>hf", function() harpoon:list():select(4) end, { desc = "Select harpoon buffer 4" })

    vim.keymap.set("n", "<C-S-z>", function() harpoon:list():prev() end, { desc = "Previous harpoon buffer" })
    vim.keymap.set("n", "<C-S-x>", function() harpoon:list():next() end, { desc = "Next harpoon buffer" })
    -- stylua: ignore end
  end,
}
