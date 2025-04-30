return {
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
					-- "clang-format",

					-- linters
					"eslint_d",
					"pylint",
					"golangci-lint",
					-- "cpplint",
					-- "cpplint",
					-- "cmakelint",
					"luacheck",
				},
			})
		end,
	},
}
