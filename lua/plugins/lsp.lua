return {
	"VonHeikemen/lsp-zero.nvim",
	branch = "v3.x",
	dependencies = {
		"neovim/nvim-lspconfig",

		-- completion
		{
			"hrsh7th/nvim-cmp",
			opts = function()
				local lsp = require("lsp-zero")
				lsp.extend_cmp()

				local cmp_action = lsp.cmp_action()
				local cmp = require("cmp")
				return {
					mapping = cmp.mapping.preset.insert({
						["<Tab>"] = cmp_action.luasnip_supertab(),
						["<S-Tab>"] = cmp_action.luasnip_shift_supertab(),
					}),
				}
			end,
		},
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/cmp-nvim-lua",
		{ "folke/neodev.nvim", opts = {} },

		"mfussenegger/nvim-lint", -- linting

		"L3MON4D3/LuaSnip", -- snippets
		"rafamadriz/friendly-snippets",

		-- formatter
		{
			"stevearc/conform.nvim",
			event = { "BufWritePre" },
			cmd = { "ConformInfo" },
			opts = {
				formatters_by_ft = {
					lua = { "stylua" },
					nix = { "alejandra" },
					rust = { "rustfmt" },
				},
				format_on_save = {
					lsp_fallback = true,
					async = false,
					timeout_ms = 500,
				},
			},
		},

		-- language specific
		"simrat39/rust-tools.nvim",

		{ "folke/trouble.nvim", dependencies = "nvim-tree/nvim-web-devicons" }, -- looks cool and stuff
	},
	config = function()
		local lsp = require("lsp-zero")

		lsp.set_sign_icons({
			error = "✘",
			warn = "▲",
			hint = "⚑",
			info = "»",
		})

		lsp.setup_servers({
			"lua_ls",
			"rust_analyzer",
			"clangd",
			"zls",
			"hls",
			"nil_ls",
		})

		vim.o.signcolumn = "yes"
		vim.diagnostic.config({ virtual_text = true })
	end,
}
