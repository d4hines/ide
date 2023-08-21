--local function init()
--    --require 'ayham.vim'.init()
--    require 'ayham.theme'.init()
--    require 'ayham.languages'.init()
--    require 'ayham.floaterm'.init()
--    require 'ayham.noice'.init()
--    require 'ayham.telescope'.init()
--end
--
--return {
--    init = init,
--}

local function init()
        vim.g.mapleader = " "
        vim.g.maplocalleader = " "
        vim.mapleader = " "
        vim.maplocalleader = " "

        -- general config
        vim.g.auto_reload_config = true
        vim.g.noswapfile = true
        vim.g.nobackup = true
        vim.g.nomodeline = true
        vim.g.nocompatible = true
        vim.g.noequalalways = true
        vim.g.wrap = true
        vim.g.textwidth = 80
        vim.g.wrapmargin = 80
        vim.g.ttimeoutlen = 0
        vim.g.autoread = true
        vim.g.ignorecase = true
        vim.g.smartcase = true
        vim.g.incsearch = true
        vim.g.magic = true
        vim.g.ruler = true
        vim.g.nomodeline = true
        vim.g.undofile = true
        vim.g.mouse = a
        vim.g.encoding = "utf-8"
        vim.g.autoindent = true
        vim.opt.number = true
        vim.opt.relativenumber = true
        vim.opt.relativenumber = true
        vim.g.NERDTreeChDirMode = 2
        vim.cmd("set clipboard+=unnamedplus")

        vim.cmd("syntax on")

        -- appearance
        vim.number = true
        -- toggle invisible characters
        --set showbreak=↪
        --set list
        --set listchars=tab:→\ ,eol:¬,trail:⋅,extends:❯,precedes:❮,space:·
        --set listchars=tab:→\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
        vim.ttyfast = true

        -- Setup theme.
        vim.t_Co = 256
        vim.o.background = "dark"
        --let g:gruvbox_termcolors=16
        --let g:gruvbox_contrast_light="hard"
        --let g:gruvbox_contrast_dark="hard"
        --colorscheme zellner
        --colorscheme wal
        --colorscheme 256_noir
        vim.cmd("colorscheme catppuccin-mocha")
end

return {
        init = init,
}
