vim.g.loaded_matchparen = 1
vim.opt.background = 'dark'
vim.o.termguicolors = true
vim.opt.foldenable = false
vim.opt.foldmethod = 'manual'
vim.opt.foldlevelstart = 99
-- vim.opt.clipboard = "unnamedplus"
-- vim.opt.cindent = true
vim.opt.completeopt = 'menuone,noinsert,noselect'
-- vim.opt.updatetime = 300
-- if key combos seem to be "lagging"
-- http://stackoverflow.com/questions/2158516/delay-before-o-opens-a-new-line
-- vim.opt.timeoutlen = 300
vim.opt.scrolloff = 2
vim.opt.wrap = true
vim.opt.signcolumn = 'yes'
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.undofile = true
vim.opt.wildmode = 'list:longest'
-- when opening a file with a command (like :e),
-- ignore these:
vim.opt.wildignore = '.hg,.svn,*~,*.png,*.jpg,*.gif,*.min.js,*.swp,*.o,vendor,dist,_site'
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true
-- case-insensitive search/replace
vim.opt.ignorecase = true
-- unless uppercase in search term
vim.opt.smartcase = true
vim.opt.vb = true
vim.opt.colorcolumn = '80'
vim.api.nvim_create_autocmd('Filetype', { pattern = 'rust', command = 'set colorcolumn=100' })
-- vim.opt.listchars = 'tab:▏-,nbsp:¬,extends:»,precedes:«,trail:•,multispace:▏   '
vim.opt.listchars = 'tab:▏-,nbsp:¬,extends:»,precedes:«,trail:•'
vim.opt.list = true
vim.opt.cursorline = true
vim.opt.showmatch = true
vim.opt.tags = './tags;,tags'
vim.opt.mouse = 'a'
vim.opt.mousemodel = 'extend'
vim.opt.fillchars:append({
    diff = ' ',
})
