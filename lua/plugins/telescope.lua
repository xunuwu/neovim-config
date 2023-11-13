return {
	-- Telescope
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.4",
		keys = {
			{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
			{ "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent files" },
			{ "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Find text" },
			{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find buffers" },
			{ "<leader>fc", "<cmd>Telescope commands<cr>", desc = "Run command" },
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
			--optional
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
	},
}
