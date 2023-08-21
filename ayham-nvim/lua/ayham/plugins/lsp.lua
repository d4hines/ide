local M = {
	"neovim/nvim-lspconfig",
	lazy = false,
	dependencies = {
		"simrat39/symbols-outline.nvim",
		"glepnir/lspsaga.nvim",

		"nvim-treesitter/nvim-treesitter",

		-- mason
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",

		"kosayoda/nvim-lightbulb",
	},
}

function M.config()
	local nvim_lsp = require("lspconfig")

	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
	capabilities.offsetEncoding = "utf-8"
	-- See :help mason-lspconfig-dynamic-server-setup
	require("mason-lspconfig").setup_handlers({
		function(server)
			nvim_lsp[server].setup({ capabilities = capabilities })
		end,
	})

	local on_attach = function(client, bufnr)
		local function buf_set_keymap(...)
			vim.api.nvim_buf_set_keymap(bufnr, ...)
		end
		local function buf_set_option(...)
			vim.api.nvim_buf_set_option(bufnr, ...)
		end

		--Enable completion triggered by <c-x><c-o>
		--buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

		local opts = { noremap = true, silent = true }

		-- Enable diagnostics
		vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
			virtual_text = true,
			signs = true,
			update_in_insert = false,
		})

		-- See `:help vim.lsp.*` for documentation on any of the below functions
		buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
		buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
		buf_set_keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
		buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
		buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
		buf_set_keymap("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
		buf_set_keymap("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
		buf_set_keymap("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
		buf_set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
		buf_set_keymap("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
		buf_set_keymap("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
		buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
		buf_set_keymap("n", "<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
		buf_set_keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
		buf_set_keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
		buf_set_keymap("n", "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
		--buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts) -- ? is this needed
	end

	local servers = { "pyright", "rust_analyzer", "clangd", "zls", "luau_lsp" }
	local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
	for _, lsp in ipairs(servers) do
		nvim_lsp[lsp].setup({ on_attach = on_attach, capabilities = capabilities })
	end

	require("symbols-outline").setup(opts)

	require("nvim-lightbulb").setup({ autocmd = { enabled = true } })
end

return M
