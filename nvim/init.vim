set mouse=a
""" Mappings"{{{

let mapleader = " "

map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>

nnoremap <leader>p :Buffers<Cr>
nnoremap <Leader>b :ls<CR>:b<Space>

noremap <silent>j gj
noremap <silent>k gk
noremap <silent>H g^
noremap <silent>L g$
map Y y$

map <c-h> <c-w>h
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l

nnoremap th  :tabfirst<CR>
nnoremap tk  :tabnext<CR>
nnoremap tj  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tn  :tabnew<Space>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>
"}}}

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
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'w0rp/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'

Plug 'preservim/nerdtree'
Plug 'preservim/tagbar'
Plug 'Yggdroot/indentLine'
Plug 'chriskempson/base16-vim'
Plug 'sheerun/vim-polyglot'
Plug 'leafoftree/vim-vue-plugin'
Plug 'styled-components/vim-styled-components', { 'branch': 'develop' }
call plug#end()
" }}}

""" Plugin Config {{{
"Airline
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.linenr = ' ☰ '
let g:airline_symbols.maxlinenr = '  '
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'

nnoremap <silent> <leader>o :FZF<Cr>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>

" NERDTree
" Quit if NERDTree is last window
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
      \ quit | endif
" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
      \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
let NERDTreeMinimalUI = 1
let TagbarMinimalUI = 1

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
set tabstop=2
set expandtab
set shiftwidth=2
set softtabstop=2
set wrap
set formatoptions=tcqrn1
set noshiftround
set autoindent
set smartindent
set breakindent
" }}}

""" Config {{{
set nocompatible

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
set hidden
set nobackup
set nowritebackup
set updatetime=300
set shortmess+=c

if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Tab
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <leader>m :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fl current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Show all diagnostics.
nnoremap <silent><nowait> <leader>a  :<C-u>CocList diagnostics<cr>
" }}}

" vim:foldmethod=marker:foldlevel=0
