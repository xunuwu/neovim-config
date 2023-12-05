return {
	"NeogitOrg/neogit",
	keys = {
		{ "<leader>og", "<cmd>lua require'neogit'.open()<cr>", desc = "Neogit" },
		{ "<leader>oc", "<cmd>lua require'neogit'.open{ 'commit' }<cr>", desc = "Neogit Commit" },
	},
	dependencies = {
		"nvim-lua/plenary.nvim", -- required
		"nvim-telescope/telescope.nvim", -- optional
		"sindrets/diffview.nvim", -- optional
		"ibhagwan/fzf-lua", -- optional
	},
	config = true,
}
