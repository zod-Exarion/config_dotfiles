return {
	{
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile" },

		config = function()
			local conform = require("conform")
			conform.setup({

				formatters_by_ft = {
					javascript = { "prettier" },
					html = { "prettier" },
					css = { "prettier" },
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
}
