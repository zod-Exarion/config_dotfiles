return {
	{
		"williamboman/mason.nvim",

		config = function()
			require("mason").setup({
				registries = {
					"github:mason-org/mason-registry",
				},
			})
		end,
	},

	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "pyright", "jdtls", "clangd", "html", "cssls", "ts_ls", "gopls" },
			})
		end,
	},

	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({})
			lspconfig.pyright.setup({})
			lspconfig.gopls.setup({})
			lspconfig.clangd.setup({})
			-- lspconfig.jdtls.setup({})
			-- lspconfig.rust_analyzer.setup({})
			-- lspconfig.html.setup({})
			-- lspconfig.cssls.setup({})
			-- lspconfig.ts_ls.setup({})

			local k = vim.keymap.set
			k("n", "F", vim.lsp.buf.hover, {})
			k("n", "GD", vim.lsp.buf.declaration, {})
			k("n", "gi", vim.lsp.buf.implementation, {})
			k({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
			k("n", "gd", vim.lsp.buf.definition, bufopts)
			k("n", "gD", function()
				local org_path = vim.api.nvim_buf_get_name(0)

				vim.api.nvim_command("normal gd")
				vim.wait(100, function() end)

				local new_path = vim.api.nvim_buf_get_name(0)
				if not (org_path == new_path) then
					vim.api.nvim_command("0tabnew %")

					vim.api.nvim_command("b " .. org_path)
					vim.api.nvim_command('normal! `"')

					vim.api.nvim_command("normal! gt")
				end
			end, bufopts)
		end,
	},
	{
		{
			"onsails/lspkind.nvim",
			event = { "VimEnter" },
		},
		{
			"L3MON4D3/LuaSnip",
			version = "v2.*",
		},
		{
			"hrsh7th/nvim-cmp",
			dependencies = {
				"lspkind.nvim",
				"hrsh7th/cmp-nvim-lsp",
				"hrsh7th/cmp-buffer",
				"hrsh7th/cmp-path",
				"hrsh7th/cmp-cmdline",
			},
			config = function()
				local has_words_before = function()
					unpack = unpack or table.unpack
					local line, col = unpack(vim.api.nvim_win_get_cursor(0))
					return col ~= 0
						and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
				end

				local luasnip = require("luasnip")
				local cmp = require("cmp")

				cmp.setup({
					snippet = {
						expand = function(args)
							require("luasnip").lsp_expand(args.body)
						end,
					},
					mapping = cmp.mapping.preset.insert({
						["<C-b>"] = cmp.mapping.scroll_docs(-4),
						["<C-f>"] = cmp.mapping.scroll_docs(4),
						["<C-k>"] = cmp.mapping.select_prev_item(),
						["<C-j>"] = cmp.mapping.select_next_item(),
						["<CR>"] = cmp.mapping.confirm({ select = true }),

						["<Tab>"] = cmp.mapping(function(fallback)
							if cmp.visible() then
								cmp.select_next_item()
							elseif has_words_before() then
								cmp.complete()
							else
								fallback()
							end
						end, { "i", "s" }),
						["<S-Tab>"] = cmp.mapping(function(fallback)
							if cmp.visible() then
								cmp.select_prev_item()
							elseif luasnip.jumpable(-1) then
								luasnip.jump(-1)
							else
								fallback()
							end
						end, { "i", "s" }),
					}),

					formatting = {
						fields = { "abbr", "menu" },

						format = function(entry, vim_item)
							vim_item.menu = ({
								nvim_lsp = "[Lsp]",
								luasnip = "[Luasnip]",
								buffer = "[File]",
								path = "[Path]",
							})[entry.source.name]
							return vim_item
						end,
					},

					sources = cmp.config.sources({
						{ name = "nvim_lsp" },
						{ name = "luasnip" },
						{ name = "buffer" },
						{ name = "path" },
					}),
				})
			end,
		},
	},

	{
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile" },

		config = function()
			local conform = require("conform")
			conform.setup({

				formatters_by_ft = {
					javascript = { "prettier" },
					lua = { "stylua" },
					python = { "isort", "black" },
					go = { "gofumpt", "golines" },
					c = { "clang-format" },
					cpp = { "clang-format" },
				},
				format_on_save = {
					lsp_fallback = true,
					async = false,
					timeout_ms = 500,
				},
			})

			vim.keymap.set({ "n", "v" }, "<leader>f", function()
				conform.format({
					lsp_fallback = true,
					async = false,
					timeout_ms = 500,
				})
			end, { desc = "Format" })
		end,
	},

	{
		"mfussenegger/nvim-lint",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local lint = require("lint")

			lint.linters_by_ft = {
				javascript = { "eslint_d" },
				python = { "pylint" },
				go = { "golangcilint" },
				c = { "cpplint" },
				cpp = { "cpplint" },
				cmake = { "cmakelint" },
				lua = { "luacheck" },
			}

			local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

			vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
				group = lint_augroup,
				callback = function()
					lint.try_lint()
				end,
			})

			vim.keymap.set("n", "<leader>l", function()
				lint.try_lint()
			end, { desc = "Trigger linting for current file" })
		end,
	},

	{
		"WhoIsSethDaniel/mason-tool-installer",

		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = {
					-- formatters
					"prettier",
					"stylua",
					"isort",
					"black",
					"gofumpt",
					"golines",
					"clang-format",

					-- linters
					"eslint_d",
					"pylint",
					"golangci-lint",
					"cpplint",
					"cpplint",
					"cmakelint",
					"luacheck",
				},
			})
		end,
	},
}
