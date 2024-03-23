return {
	"VonHeikemen/lsp-zero.nvim",
	branch = "v3.x",
	lazy = true,
	init = function()
		vim.g.lsp_zero_extend_cmp = 0
		vim.g.lsp_zero_extend_lspconfig = 0
	end,

	-- completion
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			{ "L3MON4D3/LuaSnip" },
			{ "rafamadriz/friendly-snippets" },
			{ "onsails/lspkind.nvim" },
		},
		config = function()
			local lsp_zero = require("lsp-zero")
			--lsp_zero.extend_cmp()

			local cmp = require("cmp")
			local cmp_action = lsp_zero.cmp_action()

			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
				formatting = {
					fields = { "abbr", "kind", "menu" },
					format = require("lspkind").cmp_format({
						mode = "text_symbol",
						maxwidth = 50,
						ellipsis_char = "...",
						symbol_map = {
							Text = "󰉿 ",
							Method = "󰆧 ",
							Function = "󰊕 ",
							Constructor = " ",
							Field = "󰜢 ",
							Variable = "󰀫 ",
							Class = "󰠱 ",
							Interface = " ",
							Module = " ",
							Property = "󰜢 ",
							Unit = "󰑭 ",
							Value = "󰎠 ",
							Enum = " ",
							Keyword = "󰌋 ",
							Snippet = " ",
							Color = "󰏘 ",
							File = "󰈙 ",
							Reference = "󰈇 ",
							Folder = "󰉋 ",
							EnumMember = " ",
							Constant = "󰏿 ",
							Struct = "󰙅 ",
							Event = " ",
							Operator = "󰆕 ",
							TypeParameter = "",
						},
					}),
				},
				sources = {
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
				},
				mapping = cmp.mapping.preset.insert({
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				}),
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		cmd = "LspInfo",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{ "hrsh7th/cmp-nvim-lsp" },

			-- lang specific
			{ "folke/neodev.nvim" },
		},
		config = function()
			require("neodev").setup()

			local lsp_zero = require("lsp-zero")
			lsp_zero.extend_lspconfig()

			lsp_zero.on_attach(function(client, bufnr)
				lsp_zero.default_keymaps({ buffer = bufnr })
				if client.server_capabilities.inlayHintProvider then
					vim.lsp.inlay_hint.enable(bufnr, true)
					vim.keymap.set("n", "<leader>lh", function()
						vim.lsp.inlay_hint.enable(bufnr, not vim.lsp.inlay_hint.is_enabled())
					end, { desc = "toggle inlay hints", buffer = bufnr })
				end
			end)

			lsp_zero.set_sign_icons({
				error = "✘",
				warn = "▲",
				hint = "⚑",
				info = "»",
			})

			lsp_zero.setup_servers({
				"gopls",
				"clojure_lsp",
				"lua_ls",
				"rust_analyzer",
				"clangd",
				"zls",
				"hls",
				"nil_ls",
			})
		end,
	},
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
				clojure = { "cljfmt" },
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			},
		},
	},
}
