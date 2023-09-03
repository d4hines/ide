-- Setups of plugins who don't deserve a file
local function init()
        require("alpha").setup(require("alpha.themes.startify").config)

        require("dressing").setup()

        require("diffview").setup()
        require("luasnip/loaders/from_vscode").load()
        require("luasnip.loaders.from_vscode").lazy_load()

        require("lint").linters_by_ft = {
                markdown = { "markdownlint" },
        }

        vim.api.nvim_create_autocmd({ "BufWritePost" }, {
                callback = function()
                        require("lint").try_lint()
                end,
        })

        require("gitsigns").setup()
        require("fidget").setup({})
        require("nvim-autopairs").setup({})
        require("nvim-autopairs").enable()

        -- neoformat on save
        vim.cmd([[augroup fmt
        autocmd!
        autocmd BufWritePre * silent! undojoin | silent! Neoformat
        augroup END]])
end

return {
        init = init,
}
