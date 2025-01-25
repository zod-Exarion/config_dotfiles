return {
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim'},

    config = function()
      local builtin = require("telescope.builtin")
      local k = vim.keymap.set

      k('n', '<C-p>', builtin.find_files,{})
      k('n', '<leader>g', builtin.live_grep,{})
      k('n', '<leader>ac', builtin.commands,{})
      k('n', '<leader>ts', '<CMD>Telescope<CR>')

      require('telescope').setup({
        defaults={
          layout_strategy='horizontal',
          layout_config={
            horizontal={
              width=125,
            }
          }
        }
      })
    end
  },

  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function ()
      require("telescope").setup {
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {
              -- even more opts
            }

            -- pseudo code / specification for writing custom displays, like the one
            -- for "codeactions"
            -- specific_opts = {
            --   [kind] = {
            --     make_indexed = function(items) -> indexed_items, width,
            --     make_displayer = function(widths) -> displayer
            --     make_display = function(displayer) -> function(e)
            --     make_ordinal = function(e) -> string
            --   },
            --   -- for example to disable the custom builtin "codeactions" display
            --      do the following
            --   codeactions = false,
            -- }
          }
        }
      }
      -- To get ui-select loaded and working with telescope, you need to call
      -- load_extension, somewhere after setup function:
      require("telescope").load_extension("ui-select")
    end
  }
}

