return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	keys = {
		{
			"<leader>oo",
			function()
				require("oil").open()
			end,
			desc = "Oil",
		},
		{
			"<leader>o;",
			function()
				require("oil").toggle_float()
			end,
			desc = "Oil floating",
		},
	},
	opts = {},
}
