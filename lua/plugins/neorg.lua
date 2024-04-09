return {
	{
		"nvim-neorg/neorg",
		dependencies = { "vhyrro/luarocks.nvim" },
		config = function()
			require("neorg").setup({
				load = {
					["core.defaults"] = {},
					["core.concealer"] = {},
					["core.dirman"] = {
						config = {
							workspaces = {
								notes = os.getenv("XDG_DOCUMENTS_DIR") .. "/neorg",
							},
							default_workspace = "notes",
						},
					},
				},
			})

			vim.wo.foldlevel = 99
			vim.wo.conceallevel = 3
		end,
	},
	{
		"vhyrro/luarocks.nvim",
		priority = 1000,
		config = true,
	},
}
