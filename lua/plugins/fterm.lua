return {
	"numToStr/FTerm.nvim",
	keys = {
		{
			"<M-j>",
			function()
				require("FTerm").toggle()
			end,
			mode = { "n", "t" },
			desc = "Toggle FTerm",
		},
	},
}
