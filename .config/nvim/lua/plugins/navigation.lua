return {
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",

		config = function()
			local harpoon = require("harpoon")

			harpoon:setup()

			vim.keymap.set("n", "<leader>m", function()
				harpoon:list():add()
			end)
			vim.keymap.set("n", "<leader>h", function()
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end)

			vim.keymap.set("n", "<A-h>", function()
				harpoon:list():select(1)
			end)
			vim.keymap.set("n", "<A-j>", function()
				harpoon:list():select(2)
			end)
			vim.keymap.set("n", "<A-k>", function()
				harpoon:list():select(3)
			end)
			vim.keymap.set("n", "<A-l>", function()
				harpoon:list():select(4)
			end)

			-- Toggle previous & next buffers stored within Harpoon list
			vim.keymap.set("n", "<leader>ph", function()
				harpoon:list():prev()
			end)
			vim.keymap.set("n", "<leader>nh", function()
				harpoon:list():next()
			end)
		end,
	},

	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
		},

		config = function()
			require("neo-tree").setup({
				vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<CR>"),
			})
		end,
	},
}
