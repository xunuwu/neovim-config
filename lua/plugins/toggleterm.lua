return {
	"akinsho/toggleterm.nvim",
	keys = {
		{ "<leader>of", "<cmd>ToggleTerm direction=float<cr>" },
		{ "<leader>og", "<cmd>lua _gitui_toggle()<cr>" },
	},
	opts = function()
		local Terminal = require("toggleterm.terminal").Terminal
		local gitui = Terminal:new({
			cmd = "gitui",
			direction = "float",
			hidden = true,
		})

		function _gitui_toggle()
			gitui:toggle()
		end
	end,
}