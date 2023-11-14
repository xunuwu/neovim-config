return {
	"goolord/alpha-nvim",
	event = "VimEnter",

	config = function(_, dashboard)
		-- close Lazy and re-open when the dashboard is ready
		if vim.o.filetype == "lazy" then
			vim.cmd.close()
			vim.cmd.nvim_create_autocmd("User", {
				pattern = "AlphaReady",
				callback = function()
					require("lazy").show()
				end,
			})
		end
		require("alpha").setup(dashboard.opts)
	end,

	opts = function()
		local dashboard = require("alpha.themes.dashboard")
		dashboard.section.header.val = {
			[[ooooo      ooo                                  o8o                   ]],
			[[`888b.     `8'                                  `"'                   ]],
			[[ 8 `88b.    8   .ooooo.   .ooooo.  oooo    ooo oooo  ooo. .oo.  .oo.  ]],
			[[ 8   `88b.  8  d88' `88b d88' `88b  `88.  .8'  `888  `888P"Y88bP"Y88b ]],
			[[ 8     `88b.8  888ooo888 888   888   `88..8'    888   888   888   888 ]],
			[[ 8       `888  888    .o 888   888    `888'     888   888   888   888 ]],
			[[o8o        `8  `Y8bod8P' `Y8bod8P'     `8'     o888o o888o o888o o888o]],
		}
		dashboard.section.buttons.val = {
			dashboard.button("SPC f f", "󰥨 " .. " Find file"),
			dashboard.button("SPC f r", " " .. " Recent files"),
			dashboard.button("SPC f g", " " .. " Grep text"),
		}
		for _, button in ipairs(dashboard.section.buttons.val) do
			button.opts.hl = "AlphaButtons"
			button.opts.hl_shortcut = "AlphaShortcut"
		end
		dashboard.section.header.opts.hl = "AlphaHeader"
		dashboard.section.buttons.opts.hl = "AlphaButtons"
		dashboard.section.footer.opts.hl = "AlphaHeader"
		dashboard.opts.layout[1].val = 8
		return dashboard
	end,
	dependencies = { "nvim-tree/nvim-web-devicons" },
}
