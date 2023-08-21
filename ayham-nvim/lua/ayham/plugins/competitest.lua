local M = {
	"xeluxee/competitest.nvim",
	keys = { { "<leader>t" } },
	dependencies = {
		"MunifTanjim/nui.nvim",
	},
	dev = false,
}

function M.config()
	-- competitive programing
	vim.keymap.set("n", "<leader>tt", ":CompetiTest run<CR>")
	vim.keymap.set("n", "<leader>trp", ":CompetiTest receive problem<CR>")
	vim.keymap.set("n", "<leader>trc", ":CompetiTest receive contest<CR>")
	vim.keymap.set("n", "<leader>ta", ":CompetiTestAdd<CR> ")
	require("competitest").setup({
		template_file = "~/.config/cpbooster/template.$(FEXT)",
	})
end

return M
