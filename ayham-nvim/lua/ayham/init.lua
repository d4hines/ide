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
        vim.opt.autoindent = true
        vim.opt.expandtab = true
        vim.opt.tabstop = 4
        vim.opt.shiftwidth = 4
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

        vim.cmd("set cursorline")

        -- Setup theme.
        vim.t_Co = 256
        vim.o.background = "dark"
        --let g:gruvbox_termcolors=16
        vim.cmd("let g:gruvbox_contrast_light=\"hard\"")
        vim.cmd("let g:gruvbox_contrast_dark=\"hard\"")
        vim.cmd("colorscheme gruvbox")

        require 'ayham.keymaps'.init()
        require 'ayham.lsp'.init()
        require 'ayham.treesitter'.init()
        require 'ayham.telescope'.init()
        require 'ayham.setups'.init()
        require 'ayham.cmp'.init()
        require 'ayham.dap'.init()
end

return {
        init = init,
}
