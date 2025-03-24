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
          file = item.value
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
              ["dd"] = { "harpoon_delete", mode = { "n", "x" } }
            }
          },
          list = {
            keys = {
              ["dd"] = { "harpoon_delete", mode = { "n", "x" } }
            }
          },
        },
        actions = {
          harpoon_delete = function(picker, item)
            local to_remove = item or picker:selected()
            table.remove(harpoon:list().items, to_remove.idx)
            picker:find({
              refresh = true,
            })
          end
        },
      })
    end

    vim.keymap.set("n", "<C-e>", function() toggle_snacks_picker(harpoon:list()) end, { desc = "Open harpoon window" })
    -- vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

    vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
    vim.keymap.set("n", "<leader>r", function() harpoon:list():remove() end)

    vim.keymap.set("n", "<leader>ha", function() harpoon:list():select(1) end)
    vim.keymap.set("n", "<leader>hs", function() harpoon:list():select(2) end)
    vim.keymap.set("n", "<leader>hd", function() harpoon:list():select(3) end)
    vim.keymap.set("n", "<leader>hf", function() harpoon:list():select(4) end)
    vim.keymap.set("n", "<leader>hg", function() harpoon:list():select(5) end)

    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set("n", "<leader>z", function() harpoon:list():prev() end)
    vim.keymap.set("n", "<leader>x", function() harpoon:list():next() end)
  end,
}
