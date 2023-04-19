""" Plugins {{{
filetype plugin indent on
set nocompatible

if empty(glob('$XDG_CONFIG_HOME/nvim/autoload/plug.vim'))
  silent !curl -fLo $XDG_CONFIG_HOME/nvim/autoload/plug.vim --Create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin("$VIMCONFIG/plugged")
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

Plug 'rust-lang/rust.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'cespare/vim-toml'

Plug 'christoomey/vim-tmux-navigator'

Plug 'chriskempson/base16-vim'
call plug#end()
" }}}
""" Plugin Config {{{
let g:rustfmt_autosave = 1
let g:rust_use_custom_ctags_defs = 1
let g:fzf_preview_window = []

" vim-tmux-navigator
let g:tmux_navigator_no_mappings = 1
let g:tmux_navigator_save_on_switch = 2

nnoremap <silent> <c-h> :TmuxNavigateLeft<CR>
nnoremap <silent> <c-j> :TmuxNavigateDown<CR>
nnoremap <silent> <c-k> :TmuxNavigateUp<CR>
nnoremap <silent> <c-l> :TmuxNavigateRight<CR>
nnoremap <silent> <c-\> :TmuxNavigatePrevious<CR>

" Airline
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.linenr = ' '
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.colnr = ':'
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''

" Colourscheme
let base16colorspace=256  " Access colors present in 256 colorspace
set termguicolors
colorscheme base16-gruvbox-dark-hard

" Go
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1
let g:go_highlight_diagnostic_errors = 1
let g:go_highlight_diagnostic_warnings = 1
" }}}
""" Config {{{
set mouse=a
set cursorline

" Number lines
set number
set relativenumber

" Spaces & Tabs
set tabstop=4
set noexpandtab
set shiftwidth=4
set softtabstop=4

set wrap
set formatoptions=tcqrn1
set tw=100
set autoindent

" Sane splits
set splitright
set splitbelow

" Tags
set tags+=./tags;,tags

" Decent wildmenu
set wildmenu
set wildmode=list:longest
set wildignore=.hg,.svn,*~,*.png,*.jpg,*.gif,*.settings,Thumbs.db,*.min.js,*.swp,publish/*,intermediate/*,*.o,*.hi,Zend,vendor

" GUI
set guioptions-=T " Remove toolbar
set vb t_vb=
set scrolloff=3
set backspace=indent,eol,start

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
" }}}
""" Mappings"{{{
let mapleader = " "

nnoremap <leader>o :Files<CR>
nnoremap <leader>; :Buffers<CR>
nnoremap <leader>] :Tags<CR>

" Change directory to directory of current file
nnoremap <leader>cd :cd %:h<CR>

" Quickfix
noremap <silent> ]o :QFix 1 1<CR>
noremap <silent> [o :QFix 0 1<CR>
noremap [q :cprev<CR>
noremap ]q :cnext<CR>
noremap [Q :cfirst<CR>
noremap ]Q :clast<CR>

"Location List
nnoremap <silent> [; :LList 0 1<CR>
nnoremap <silent> ]; :LList 1 1<CR>
nnoremap [l :lprev<CR>
nnoremap ]l :lnext<CR>
nnoremap [L :lfirst<CR>
nnoremap ]L :llast<CR>
" Open tags in LList
nnoremap gl] g]<CR>:ltag<CR>:VList<CR><CR>

" Tags
" Generate ctags
nnoremap <leader>t :!t <CR>
nnoremap [t :tprevious<CR>
nnoremap ]t :tnext<CR>
nnoremap [T :tfirst<CR>
nnoremap ]T :tlast<CR>
nnoremap [tw :ptprevious<CR>
nnoremap ]tw :ptnext<CR>
nnoremap [TW :ptfirst<CR>
nnoremap ]TW :ptlast<CR>

" Buffers
" Toggle between buffers
nnoremap <leader>b <c-^>
nnoremap [b :bprevious<CR>
nnoremap ]b :bnext<CR>
nnoremap [B :bfirst<CR>
nnoremap ]B :blast<CR>

" Navigation QOL
noremap <silent>j gj
noremap <silent>k gk
noremap <silent>H g^
noremap <silent>L g$

map Y y$
vnoremap <leader>y "+y<CR>
noremap <leader>p :read !xsel --clipboard --output<CR>
noremap <leader>c :w !xsel -ib<CR><CR>

noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>
"]}}}
""" Utils {{{
" Permanent undo
set undodir=$XDG_CACHE_HOME/.vimdid
set undofile

" Quickfix Toggle
command! VFix botright vertical copen | vertical resize 50
command! -nargs=* QFix call QFixToggle(<f-args>)
function! QFixToggle(v, e)
	if exists("g:qfix_win") && a:e == 1
		cclose
		unlet g:qfix_win
	else
		if a:v == 0
			copen
		else
			VFix
		endif
		let g:qfix_win = bufnr("$")
	endif
endfunction
" Location List Toggle
command! VList botright vertical lopen | vertical resize 50
command! -nargs=* LList call LListToggle (<f-args>)
function! LListToggle(v, e)
	if exists("g:llist_win") && a:e == 1
		lclose
		unlet g:llist_win
	else
		if a:v == 0
			lopen
		else
			VList
		endif
		let g:llist_win = bufnr("$")
	endif
endfunction
"}}}
""" Search Tools {{{
set incsearch
set hlsearch
set ignorecase
set smartcase
set showmatch
set matchpairs+=<:>
map <leader>, :let @/=''<CR>

" Include subfolders
set path+=**

" Center search results
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz
"}}}
""" Grep{{{
noremap <Leader>g :grep -g !tags<space><C-r><C-w><CR>:QFix 0 0<CR><CR>
noremap <leader>r :grep<space>
noremap <leader>lg :lgrep -g !tags<space><C-r><C-w><CR>:QFix 0 0<CR><CR>
noremap <leader>lr :lgrep<space>

"Fzf grep results
noremap <leader>s :Rg<space>

if executable("rg")
  set grepprg=rg\ --vimgrep\ --no-heading
  set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

let g:fzf_layout = { 'down': '~25%' }
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always -g !tags '
  \   .shellescape(<q-args>), 1)

function! s:list_cmd()
  let base = fnamemodify(expand('%'), ':h:.:S')
  return base == '.' ? 'fd --type file --follow' : printf('fd --type file --follow | proximity-sort %s', shellescape(expand('%')))
endfunction

command! -bang -nargs=? -complete=dir Files
  \call fzf#vim#files(<q-args>, {'source': s:list_cmd(),
  \                               'options': '--tiebreak=index'}, <bang>0)
" }}}
""" Notes {{{
" Go to Note Directory
nnoremap <leader>ncd :cd $NOTES_DIR<CR>
" Ripgrep Notes
nnoremap <leader>ng :cd $NOTES_DIR<CR>:Ngrep<space><C-r><C-w><CR>:QFix 1 0<CR><CR>
nnoremap <leader>nr :cd $NOTES_DIR<CR>:Ngrep<space>
" FZF Notes (multi-tag)
nnoremap <leader>ns :cd $NOTES_DIR<CR>:Nf (^\|[[:space::]])@(\w\S*)<CR>
" Get Questions
nnoremap <leader>nq :grep /\*\*Q\*\*/ %<CR>
" Create New Note
nnoremap <leader>nn :NewNote
" Create Note Link
nnoremap <leader>nl :call fzf#run({'sink': 'HandleFZF', 'down': '25%'}) <CR>

" Create Note
command! -nargs=1 NewNote :call NewNote(<f-args>)
command! -nargs=1 CreateNote :execute ":e" $NOTES_DIR . '/' . strftime("%Y%m%d%H%M") . "-<args>.md"
function! NewNote(name)
	let filename = a:name
	:CreateNote ".filename."
	:r! date
endfunction

" Note Search
command! -bang -nargs=* Nf
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always -g !tags -e '
  \   .shellescape(<q-args>), 1)

command! -nargs=1 Ngrep grep "<args>" -g "*.md" $NOTES_DIR

" Note Linking
function! HandleFZF(file)
    let filename = fnameescape(a:file)
    let filename_wo_timestamp = fnameescape(fnamemodify(a:file, ":t:s/^[0-9]*-//"))
    let mdlink = "[ ".filename_wo_timestamp." ]( ".filename." )"
    put=mdlink
endfunction
command! -nargs=1 HandleFZF :call HandleFZF(<f-args>)

"}}}
""" Folding {{{
set foldenable
set foldlevelstart=0
set foldnestmax=10
set foldmethod=marker
set modelines=1
" }}}
