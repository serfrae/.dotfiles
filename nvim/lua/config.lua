vim.o([[
set mouse=a
set cursorline
]])

-- Number Lines
vim.o([[
set number
set relativenumber
]])

-- Spaces & Tabs
vim.o([[
set tabstop=4
set noexpandtab
set shiftwidth=4
set softtabstop=4
set wrap
set formatoptions=tcqrn1
set tw=100
set autoindent
]])

-- Sane splits
vim.o([[
set splitright
set splitbelow
]])

vim.o.(set tags=./tags;.tags)

-- Decent wildmenu
vim.o([[
set wildmenu
set wildmode=list:longest
set wildignore=.hg,.svn,*~,*.png,*.jpg,*.gif,*.settings,Thumbs.db,*.min.js,*.swp,publish/*,intermediate/*,*.o,*.hi,Zend,vendor
]])

-- GUI
vim.o([[
set guioptions-=T
set vb t_vb=
set scrolloff=3
set signcolumn=yes
set encoding=utf-8
set hidden
set ttyfast
set laststatus=2
set lazyredraw
set noshowmode
set showcmd
syntax enable
set showbreak=↪\
set listchars=tab:▸\ ,eol:↲,nbsp:␣,trail:•,precedes:←,extends:→
map \l :set list!<CR> " Toggle tabs and EOL
]])

-- Search tools
vim.cmd([[
set incsearch
set hlsearch
set ignorecase
set smartcase
set showmatch
set matchpairs+=<:>
set path+=**
]])
