return {
	-- Telescope
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.4",
		keys = {
			{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
			{ "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent files" },
			{ "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Find text" },
			{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find buffers" },
			{ "<leader>fc", "<cmd>Telescope commands<cr>", desc = "Run command" },
			{ "<leader>fe", "<cmd>Telescope file_browser path=%:p:h select_buffer=true<cr>", desc = "File browser" },
			{
				"<leader>sa",
				function()
					require("telescope").extensions.smart_open.smart_open()
				end,
				desc = "",
				{ noremap = true, silent = true },
			},
			{
				"<leader>sl",
				function()
					require("telescope").extensions.smart_open.smart_open({
						cwd_only = true,
						filename_first = false,
					})
				end,
				desc = "",
				{ noremap = true, silent = true },
			},
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
			--optional
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
			{
				"nvim-telescope/telescope-file-browser.nvim",
				config = function()
					require("telescope").load_extension("file_browser")
				end,
			},
			{
				"danielfalk/smart-open.nvim",
				branch = "0.2.x",
				config = function()
					require("telescope").load_extension("smart_open")
				end,
				dependencies = {
					{ "kkharji/sqlite.lua" },
					-- Only required if using match_algorithm fzf
					{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
					-- Optional.  If installed, native fzy will be used when match_algorithm is fzy
					{ "nvim-telescope/telescope-fzy-native.nvim" },
				},
			},
		},
		opts = {
			extensions = {
				file_browser = {},
				smart_open = {
					show_scores = false,
					ignore_patterns = { "*.git/*", "*/tmp/*" },
					match_algorithm = "fzy",
					disable_devicons = false,
					open_buffer_indicators = { previous = "👀", others = "🙈" },
				},
			},
		},
	},
}
