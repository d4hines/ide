-- Setups of plugins who don't deserve a file
local function init()
        require("catppuccin").setup({
                flavour = "frappe"
        })
        -- require("alpha").setup(require("alpha.themes.startify").config)

        -- require("dressing").setup()

        -- require("diffview").setup()
        -- require("luasnip/loaders/from_vscode").load()
        -- require("luasnip.loaders.from_vscode").lazy_load()

        -- require("lint").linters_by_ft = {
        --         markdown = { "markdownlint" },
        -- }

        -- vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        --         callback = function()
        --                 require("lint").try_lint()
        --         end,
        -- })

        require("gitsigns").setup {
             signs = {
                add = { text = '+' },
                change = { text = '~' },
                delete = { text = '_' },
                topdelete = { text = '‾' },
                changedelete = { text = '~' },
              },
              on_attach = function(bufnr)
                vim.keymap.set('n', '<leader>gp', require('gitsigns').prev_hunk, { buffer = bufnr, desc = '[G]o to [P]revious Hunk' })
                vim.keymap.set('n', '<leader>gn', require('gitsigns').next_hunk, { buffer = bufnr, desc = '[G]o to [N]ext Hunk' })
                vim.keymap.set('n', '<leader>ph', require('gitsigns').preview_hunk, { buffer = bufnr, desc = '[P]review [H]unk' })
              end,
        } 
        require("lualine").setup {
                options = {
                        icons_enabled = true,
                        theme = 'catppuccin',
                        component_separators = '|',
                        section_separators = '',
                      },
        }
        -- require("fidget").setup({})
        -- require("nvim-autopairs").setup({})
        -- require("nvim-autopairs").enable()

        -- -- neoformat on save
        -- vim.cmd([[augroup fmt
        -- autocmd!
        -- autocmd BufWritePre * silent! undojoin | silent! Neoformat
        -- augroup END]])
end

return {
        init = init,
}
