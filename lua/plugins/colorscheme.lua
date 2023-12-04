return {
	"projekt0n/github-nvim-theme",
	priority = 1000,
	config = function()
		require("github-theme").setup({
			groups = {
				github_dark_default = {
					CursorLine = { bg = "#202020" },
				},
			},
		})
		vim.cmd([[colorscheme github_dark_default]])
	end,
}
