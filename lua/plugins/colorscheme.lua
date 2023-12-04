return {
	"projekt0n/github-nvim-theme",
	priority = 1000,
	config = function()
		vim.cmd([[colorscheme github_dark_default]])
		vim.cmd([[highlight CursorLine guibg=#202020]])
		vim.cmd([[highlight StatusLine guibg=#252025]])
	end,
}
