local M = {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	lazy = false,
	dependencies = {
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-nvim-lua",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/cmp-calc",
		"hrsh7th/cmp-emoji",
		--"rcarriga/cmp-dap",
		"f3fora/cmp-spell",
		"L3MON4D3/LuaSnip",
		"onsails/lspkind-nvim",
		"rafamadriz/friendly-snippets",
	},
}

function M.config()
	local cmp = require("cmp")
	local lspkind = require("lspkind")
	vim.opt.completeopt = { "menu", "menuone", "noselect" }
	cmp.setup({
		mapping = cmp.mapping.preset.insert({
			["<C-b>"] = cmp.mapping.scroll_docs(-4),
			["<C-f>"] = cmp.mapping.scroll_docs(4),
			["<C-Space>"] = cmp.mapping.complete(),
			["<C-e>"] = cmp.mapping.abort(),
			["<CR>"] = cmp.mapping.confirm({ select = true }),
		}),
		snippet = {
			expand = function(args)
				require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
			end,
		},
		window = {
			--completion = cmp.config.window.bordered(),
			--documentation = cmp.config.window.bordered(),
		},
		sources = cmp.config.sources({
			{ name = "nvim_lsp" },
			--{ name = "nvim_lua" },
			{ name = "luasnip" },
			{ name = "emoji" },
			{ name = "calc" },
			--{ name = "dap" },
			{ name = "spell" },
			{ name = "buffer", keyword_length = 5 },
		}),
		experemintal = {
			ghost_text = true,
		},
		formatting = {
			format = lspkind.cmp_format({
				mode = "symbol_text",
				menu = {
					buffer = "[Buffer]",
					nvim_lsp = "[LSP]",
					luasnip = "[LuaSnip]",
					nvim_lua = "[Lua]",
					latex_symbols = "[Latex]",
				},
			}),
		},
	})
	local cmp_autopairs = require("nvim-autopairs.completion.cmp")
	cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

	-- Set configuration for specific filetype.
	cmp.setup.filetype("gitcommit", {
		sources = cmp.config.sources({
			{ name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
		}, {
			{ name = "buffer" },
		}),
	})

	-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
	cmp.setup.cmdline({ "/", "?" }, {
		mapping = cmp.mapping.preset.cmdline(),
		sources = {
			{ name = "buffer" },
		},
	})

	-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
	cmp.setup.cmdline(":", {
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({
			{ name = "path" },
		}, {
			{ name = "cmdline" },
		}),
	})
end

return M
