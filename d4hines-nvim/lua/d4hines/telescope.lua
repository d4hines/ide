local function init()
	vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>")
	vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>")
	vim.keymap.set("n", "<leader>fb", ":Telescope buffers<CR>")
	vim.keymap.set("n", "<leader>fh", ":Telescope help_tags<CR>")
	vim.keymap.set("n", "<leader>fd", ":Telescope lsp_definitions<CR>")
	vim.keymap.set("n", "<leader>fs", ":Telescope lsp_document_symbols<CR>")
	vim.keymap.set("n", "<leader>fr", ":Telescope lsp_references<CR>")

	local actions = require("telescope.actions")
	require("telescope").setup({
		defaults = {
			file_sorter = require("telescope.sorters").get_fzy_sorter,
			prompt_prefix = " >",
			color_devicons = true,

			file_previewer = require("telescope.previewers").vim_buffer_cat.new,
			grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
			qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,

			mappings = {
				i = {
					["<C-x>"] = false,
					["<C-q>"] = actions.send_to_qflist,
				},
			},
		},
		extensions = {
			fzy_native = {
				override_generic_sorter = false,
				override_file_sorter = true,
			},
		},
	})

	require("telescope").load_extension("fzy_native")
	require("telescope").load_extension("dap")
end

return {
        init = init,
}
