return {
	"nyoom-engineering/oxocarbon.nvim",
	commit = "b52c62f688865ef1e1184c1a9fdcf82ca9f9d4c5", -- TODO remove when it gets merged
	priority = 1000,
	config = function()
		vim.opt.background = "dark"
		vim.cmd([[colorscheme oxocarbon]])
	end,
}
