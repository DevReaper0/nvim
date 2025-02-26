return {
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } }
      }
    }
  },
  {
    "saghen/blink.cmp",
    version = '*',
    dependencies = {
      { 'L3MON4D3/LuaSnip', version = 'v2.*' },
      'echasnovski/mini.icons'
    },
    opts = {
      snippets = {
        preset = 'luasnip'
      },
      completion = {
        list = {
          selection = {
            preselect = true,
            auto_insert = function(ctx) return ctx.mode == 'cmdline' end
          }
        },
        accept = {
          auto_brackets = { enabled = true },
        },
        menu = {
          draw = {
            components = {
              kind_icon = {
                ellipsis = false,
                text = function(ctx)
                  local kind_icon, _, _ = require('mini.icons').get('lsp', ctx.kind)
                  return kind_icon
                end,
                highlight = function(ctx)
                  local _, hl, _ = require('mini.icons').get('lsp', ctx.kind)
                  return hl
                end
              }
            }
          }
        },
        ghost_text = {
          enabled = true
        }
      },
      signature = {
        enabled = true
      },
      sources = {
        default = { "lazydev", "lsp", "path", "snippets", "buffer" },
        providers = {
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            score_offset = 100
          }
        }
      },
      cmdline = {
        keymap = {
          preset = 'default',

          --['<Tab>'] = { 'select_next', 'show', 'fallback' },
          --['<S-Tab>'] = { 'select_prev', 'show', 'fallback' },
        }
      }
    },
    opts_extend = { "sources.default" }
  }
}
