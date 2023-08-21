-- Setups of plugins who don't deserve a file
--
require("impatient")

require("alpha").setup(require("alpha.themes.startify").config)

require("mason").setup()
require("mason-lspconfig").setup()

require("dressing").setup()

require("twilight").setup({
	dimming = {
		alpha = 0.25,
		color = { "Normal", "#000000" },
	},
})
require("zen-mode").setup({
	width = 0.80,
})
require("diffview").setup()
require("luasnip/loaders/from_vscode").load()
require("luasnip.loaders.from_vscode").lazy_load()

require("Comment").setup()

require("zen-mode").setup({
	window = {
		width = 80,
		options = {
			signcolumn = "no", -- disable signcolumn
			number = false, -- disable number column
			relativenumber = false, -- disable relative numbers
			cursorline = false, -- disable cursorline
			cursorcolumn = false, -- disable cursor column
			foldcolumn = "0", -- disable fold column
			list = false, -- disable whitespace characters
		},
	},
})

require("flutter-tools").setup({})
require("Comment").setup()

require("lint").linters_by_ft = {
	markdown = { "markdownlint" },
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	callback = function()
		require("lint").try_lint()
	end,
})

--require("typos").setup()

require("gitsigns").setup()
require("fidget").setup({})
require("nvim-autopairs").setup({})
require("nvim-autopairs").enable()
require("cinnamon").setup({})
require("leap").add_default_mappings({})

-- colorschemes
require("colorbuddy").setup()

-- neoformat on save
vim.cmd([[augroup fmt
  autocmd!
  autocmd BufWritePre * silent! undojoin | silent! Neoformat
augroup END]])
