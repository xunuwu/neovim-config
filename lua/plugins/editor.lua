return {
	{
		"jinh0/eyeliner.nvim",
		opts = {
			highlight_on_key = true,
			dim = true,
		},
	},
	{
		"windwp/nvim-autopairs",
		event = { "InsertEnter" },
		opts = {
			disable_filetype = { "clojure" },
		},
	},
	{
		"dundalek/parpar.nvim",
		dependencies = { "gpanders/nvim-parinfer", "julienvincent/nvim-paredit" },
		opts = {},
	},
}
