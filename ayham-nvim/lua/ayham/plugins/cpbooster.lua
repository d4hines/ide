local M = {
	"searleser97/cpbooster.vim",
	keys = { { "<leader>t" } },
	lazy = false,
}

function M.config()
	-- competitive programing
	vim.keymap.set("n", "<leader>tt", ":Test<CR>")
	vim.keymap.set("n", "<leader>ts", ":Submit<CR>")
	--vim.keymap.set("n", "<leader>td", ":Debug<CR> ")
end

return M
