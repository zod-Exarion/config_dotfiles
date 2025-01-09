return {
  {
    "williamboman/mason.nvim",

    config = function()
      require("mason").setup({
        registries={
          "github:mason-org/mason-registry",
        }
      })
    end
  },

  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed={"lua_ls","pyright","jdtls","rust_analyzer","clangd","html","cssls","ts_ls"}
      })
    end
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({})
      lspconfig.pyright.setup({})
      lspconfig.jdtls.setup({})
      lspconfig.rust_analyzer.setup({})
      -- lspconfig.clandg.setup({})
      lspconfig.html.setup({})
      lspconfig.cssls.setup({})
      lspconfig.ts_ls.setup({})

      local k = vim.keymap.set
      k('n','F',vim.lsp.buf.hover, {})
      k('n', '<leader>gd', vim.lsp.buf.declaration, {})
      k('n', 'gi', vim.lsp.buf.implementation, {})
      k({'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action, {})
      k('n', 'gd', vim.lsp.buf.definition, bufopts)
      k('n', 'gD', function()
        local org_path = vim.api.nvim_buf_get_name(0)

        vim.api.nvim_command('normal gd')
        vim.wait(100, function() end)

        local new_path = vim.api.nvim_buf_get_name(0)
        if not (org_path == new_path) then
          vim.api.nvim_command('0tabnew %')

          vim.api.nvim_command('b ' .. org_path)
          vim.api.nvim_command('normal! `"')

          vim.api.nvim_command('normal! gt')
        end
      end, bufopts)
    end,
  }
}
