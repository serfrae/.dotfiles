set mouse=a
""" Plugins {{{
filetype indent plugin on

if empty(glob('$XDG_CONFIG_HOME/nvim/autoload/plug.vim'))
  silent !curl -fLo $XDG_CONFIG_HOME/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin("$VIMCONFIG/plugged")
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

Plug 'rust-lang/rust.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'christoomey/vim-tmux-navigator'

Plug 'chriskempson/base16-vim'
call plug#end()
" }}}
""" Plugin Config {{{
let g:rustfmt_autosave = 1
let g:fzf_preview_window = []

"vim-tmux-navigator
let g:tmux_navigator_no_mappings = 1
let g:tmux_navigator_save_on_switch = 2

nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
nnoremap <silent> <c-\> :TmuxNavigatePrevious<cr>

"Airline
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.linenr = '  '
let g:airline_symbols.maxlinenr = ' ☰  '
let g:airline_symbols.colnr = '℅ :'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'


"Colourscheme
let base16colorspace=256  " Access colors present in 256 colorspace
set termguicolors
colorscheme base16-gruvbox-dark-medium
" }}}
""" Formatting {{{
set cursorline

" Number lines
set number
set relativenumber

" Spaces & Tabs
set tabstop=4
set expandtab
set shiftwidth=4
set softtabstop=4
set wrap
set formatoptions=tcqrn1
set noshiftround
set autoindent
set smartindent
set breakindent
" }}}
""" Config {{{
set nocompatible

set guioptions-=T " Remove toolbar
set visualbell
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:>

set ruler
set modelines=0
set encoding=utf-8
set wildmenu
set hidden
set ttyfast
set laststatus=2
set lazyredraw
set showmode
set showcmd
syntax enable
set showbreak=↪\
set listchars=tab:▸\ ,eol:↲,nbsp:␣,trail:•,precedes:←,extends:→
map <leader>l :set list!<CR> " Toggle tabs and EOL
map <leader>; :terminal<CR>
" }}}
""" Mappings"{{{
let mapleader = " "

nnoremap <silent> <C-t> :Files<Cr>
nnoremap <leader>t :Buffers<Cr>

noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>

noremap <silent>j gj
noremap <silent>k gk
noremap <silent>H g^
noremap <silent>L g$
map Y y$

nnoremap th  :tabfirst<CR>
nnoremap tk  :tabnext<CR>
nnoremap tj  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tn  :tabnew<Space>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>
"}}}
""" Utils {{{
" Permanent undo
set undodir=$XDG_CACHE_HOME/.vimdid
set undofile
"}}}
""" Search Tools {{{
set incsearch
set hlsearch
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/=''<cr>

if executable("rg")
  set grepprg=rg\ --vimgrep\ --no-heading
  set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

noremap <leader>s :Rg
let g:fzf_layout = { 'down': '~20%' }
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

function! s:list_cmd()
  let base = fnamemodify(expand('%'), ':h:.:S')
  return base == '.' ? 'fd --type file --follow' : printf('fd --type file --follow | proximity-sort %s', shellescape(expand('%')))
endfunction

command! -bang -nargs=? -complete=dir Files
  \call fzf#vim#files(<q-args>, {'source': s:list_cmd(),
  \                               'options': '--tiebreak=index'}, <bang>0)

" Quick Grep
noremap <Leader>g :grep<space><C-r><C-w><CR>:copen<CR><CR><C-W>b
noremap <leader>r :grep<space>
noremap ]o :copen<cr>
noremap [o :cclose<cr>
noremap ]q :cnext<cr>
noremap [q :cprev<cr>
noremap ]Q :cfirst<cr>
noremap [Q :clast<cr>
" }}}
""" Folding {{{
set foldenable
set foldlevelstart=0
set foldnestmax=10
set foldmethod=marker
set modelines=1
" }}}
""" Coc {{{
set nobackup
set nowritebackup
set updatetime=300
set shortmess+=c

" Tab for completion
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Show documentation in a preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Scroll through float windows
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
"}}}
" vim:foldmethod=marker:foldlevel=0
