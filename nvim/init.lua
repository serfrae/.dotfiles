-- always set leader first!
vim.keymap.set("n", "<Space>", "<Nop>", { silent = true })
vim.g.mapleader = " "

-------------------------------------------------------------------------------
--
-- functions
--
-------------------------------------------------------------------------------
-- Quickfix Toggle
vim.api.nvim_create_user_command('VFix', function()
  vim.cmd('botright vertical copen')
  vim.cmd('vertical resize 50')
end, {})

function QFixToggle(v, e)
  if vim.g.qfix_win and e == 1 then
    vim.cmd('cclose')
    vim.g.qfix_win = nil
  else
    if v == 0 then
      vim.cmd('copen')
    else
      vim.cmd('VFix')
    end
    vim.g.qfix_win = vim.fn.bufnr('$')
  end
end

vim.api.nvim_create_user_command('QFix', function(opts)
  QFixToggle(opts.args, opts.bang and 1 or 0)
end, { nargs = '*', bang = true })

-- Location List Toggle
vim.api.nvim_create_user_command('VList', function()
	vim.cmd('botright vertical lopen')
	vim.cmd('vertical resize 50')
end, {})

function LListToggle(v, e)
  if vim.g.llist_win and e == 1 then
    vim.cmd('lclose')
    vim.g.llist_win = nil
  else
    if v == 0 then
      vim.cmd('lopen')
    else
      vim.cmd('VList')
    end
    vim.g.llist_win = vim.fn.bufnr('$')
  end
end

vim.api.nvim_create_user_command('LList', function(opts)
  LListToggle(opts.args, opts.bang and 1 or 0)
end, { nargs = '*', bang = true })

-- Check if "rg" is executable and set grepprg and grepformat if it is
if vim.fn.executable("rg") == 1 then
  vim.o.grepprg = "rg --vimgrep --no-heading"
  vim.o.grepformat = "%f:%l:%c:%m,%f:%l:%m"
end

-- Set the global variable g:fzf_layout in Lua
vim.g.fzf_layout = { down = '~25%' }
vim.api.nvim_create_user_command('Rg', function(opts)
  local args = table.concat(opts.fargs, ' ')
  local command = 'rg --column --line-number --no-heading --color=always -g !tags ' .. vim.fn.shellescape(args)
  vim.fn['fzf#vim#grep'](command, 1, vim.fn['fzf#vim#with_preview'](), 0)
end, { nargs = '*', bang = true })

function list_cmd()
  local base = vim.fn.fnamemodify(vim.fn.expand('%'), ':h:.:S')
  local command = ''

  if base == '.' then
    command = 'fd --type file --follow'
  else
    command = string.format('fd --type file --follow | proximity-sort %s', vim.fn.shellescape(vim.fn.expand('%')))
  end

  return command
end

-- vim.api.nvim_command('command! -bang -nargs=? -complete=dir Files call FzfFiles(<q-args>, <bang>0)')
-- 
-- function FzfFiles(args, bang)
--   local list_cmd = vim.fn['s:list_cmd']()
--   local options = '--tiebreak=index'
-- 
--   vim.fn['fzf#vim#files'](args, {
--     source = list_cmd,
--     options = options
--   }, bang)
-- end

-- NewNote
function NewNote(name)
  -- Format the filename using the provided name and the current date/time
  local filename = name
  local filepath = vim.fn.expand('~/docs/notes/') .. '/' .. os.date('%Y%m%d%H%M') .. '-' .. filename .. '.md'
  
  -- Create and edit the new note
  vim.cmd('edit ' .. filepath)
  
  -- Insert the current date and time into the file
  vim.cmd('r! date')
end

vim.api.nvim_create_user_command('NewNote', function(opts)
  NewNote(opts.args)
end, { nargs = 1 })

-- CreateNote
vim.api.nvim_create_user_command('CreateNote', function(opts)
  local filepath = vim.fn.expand('$NOTES') .. '/' .. os.date('%Y%m%d%H%M') .. '-' .. opts.args .. '.md'
  vim.cmd('edit ' .. filepath)
end, { nargs = 1 })

-- Note find
vim.api.nvim_create_user_command('Nf', function(opts)
  local args = table.concat(opts.fargs, ' ')
  local command = 'rg --column --line-number --no-heading --color=always -g !tags -e ' .. vim.fn.shellescape(args)
  vim.fn['fzf#vim#grep'](command, 1)
end, { bang = true, nargs = '*' })

-- Ngrep
vim.api.nvim_create_user_command('Ngrep', function(opts)
  local command = string.format('grep "%s" -g "*.md" %s', opts.args, vim.fn.expand('$NOTES'))
  vim.cmd(command)
end, { nargs = 1 })

-- HandleFZF
local function HandleFZF(file)
  local filename = vim.fn.fnameescape(file)
  local filename_wo_timestamp = vim.fn.fnameescape(vim.fn.fnamemodify(file, ":t:s/^[0-9]*-//"))
  local mdlink = string.format("[ %s ]( %s )", filename_wo_timestamp, filename)
  vim.api.nvim_put({ mdlink }, 'c', false, true)
end

vim.api.nvim_create_user_command('HandleFZF', function(opts)
  HandleFZF(opts.args)
end, { nargs = 1 })

-------------------------------------------------------------------------------
--
-- preferences
--
-------------------------------------------------------------------------------
vim.opt.background = 'dark'
vim.opt.foldenable = false
vim.opt.foldmethod = 'manual'
vim.opt.foldlevelstart = 99
-- vim.opt.cindent = true
-- vim.opt.cmdheight = 2
-- vim.opt.completeopt = 'menuone,noinsert,noselect'
-- vim.opt.updatetime = 300
-- if key combos seem to be "lagging"
-- http://stackoverflow.com/questions/2158516/delay-before-o-opens-a-new-line
-- vim.opt.timeoutlen = 300
-- keep more context on screen while scrolling
vim.opt.scrolloff = 2
-- never show me line breaks if they're not there
vim.opt.wrap = false
-- always draw sign column. prevents buffer moving when adding/deleting sign
vim.opt.signcolumn = 'yes'
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.splitright = true
vim.opt.splitbelow = true
-- infinite undo!
-- NOTE: ends up in ~/.local/state/nvim/undo/
vim.opt.undofile = true
--" Decent wildmenu
-- in completion, when there is more than one match,
-- list all matches, and only complete to longest common match
vim.opt.wildmode = 'list:longest'
-- when opening a file with a command (like :e),
-- don't suggest files like there:
vim.opt.wildignore = '.hg,.svn,*~,*.png,*.jpg,*.gif,*.min.js,*.swp,*.o,vendor,dist,_site'
-- tabs
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
vim.opt.expandtab = false
-- case-insensitive search/replace
vim.opt.ignorecase = true
-- unless uppercase in search term
vim.opt.smartcase = true
-- never ever make my terminal beep
vim.opt.vb = true
-- more useful diffs (nvim -d)
--- by ignoring whitespace
vim.opt.diffopt:append('iwhite')
--- and using a smarter algorithm
--- https://vimways.org/2018/the-power-of-diff/
--- https://stackoverflow.com/questions/32365271/whats-the-difference-between-git-diff-patience-and-git-diff-histogram
--- https://luppeng.wordpress.com/2020/10/10/when-to-use-each-of-the-git-diff-algorithms/
vim.opt.diffopt:append('algorithm:histogram')
vim.opt.diffopt:append('indent-heuristic')
-- show a column at 80 characters as a guide for long lines
vim.opt.colorcolumn = '80'
--- except in Rust where the rule is 100 characters
vim.api.nvim_create_autocmd('Filetype', { pattern = 'rust', command = 'set colorcolumn=100' })
-- show more hidden characters
-- also, show tabs nicer
vim.opt.listchars = 'tab:^ ,nbsp:¬,extends:»,precedes:«,trail:•'
vim.opt.cursorline = true

-------------------------------------------------------------------------------
--
-- hotkeys
--
-------------------------------------------------------------------------------
-- quick-open
vim.keymap.set('', '<leader>o', '<cmd>Files<cr>')
-- search buffers
vim.keymap.set('n', '<leader>;', '<cmd>Buffers<cr>')
-- search tags
vim.keymap.set('n', '<leader>]', '<cmd>Tags<cr>')
-- quick-save
vim.keymap.set('n', '<leader>w', '<cmd>w<cr>')
-- cd to dir of current file
vim.keymap.set('n', '<leader>cd', ':cd %:h<cr>')
-- make missing : less annoying
vim.keymap.set('n', ';', ':')
-- Jump to start and end of line using the home row keys
vim.keymap.set('', 'H', '^')
vim.keymap.set('', 'L', '$')

-- Neat X clipboard integration
-- <leader>p will paste clipboard into buffer
vim.keymap.set('n', '<leader>p', '<cmd>read !xsel --clipboard --output<cr>')
vim.keymap.set('n', '<leader>y', '<cmd>w !xsel -ib<cr><cr>')

-- always center search results
vim.keymap.set('n', 'n', 'nzz', { silent = true })
vim.keymap.set('n', 'N', 'Nzz', { silent = true })
vim.keymap.set('n', '*', '*zz', { silent = true })
vim.keymap.set('n', '#', '#zz', { silent = true })
vim.keymap.set('n', 'g*', 'g*zz', { silent = true })
-- "very magic" (less escaping needed) regexes by default
vim.keymap.set('n', '?', '?\\v')
vim.keymap.set('n', '/', '/\\v')
vim.keymap.set('c', '%s/', '%sm/')
vim.keymap.set('n', '<leader>,', ":let @/=''<cr>")

-- open new file adjacent to current file
-- vim.keymap.set('n', '<leader>o', ':e <C-R>=expand("%:p:h") . "/" <cr>')

vim.keymap.set('n', '<up>', '<nop>')
vim.keymap.set('n', '<down>', '<nop>')
vim.keymap.set('i', '<up>', '<nop>')
vim.keymap.set('i', '<down>', '<nop>')
vim.keymap.set('i', '<left>', '<nop>')
vim.keymap.set('i', '<right>', '<nop>')
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')
-- handy keymap for replacing up to next _ (like in variable names)
vim.keymap.set('n', '<leader>m', 'ct_')

-- quickfix
vim.keymap.set('n', ']o', '<cmd>QFix 1 1<cr>')
vim.keymap.set('n', '[o', '<cmd>QFix 0 1<cr>')
vim.keymap.set('n', '[q', '<cmd>cprev<cr>')
vim.keymap.set('n', ']q', '<cmd>cnext<cr>')
vim.keymap.set('n', '[Q', '<cmd>cfirst<cr>')
vim.keymap.set('n', ']Q', '<cmd>clast<cr>')

-- location list
vim.keymap.set('n', '[;', ':LList 0 1<cr>', { noremap = true, silent = true })
vim.keymap.set('n', '];', ':LList 1 1<cr>', { noremap = true, silent = true })
vim.keymap.set('n', '[l', ':lprev<cr>')
vim.keymap.set('n', ']l', ':lnext<cr>')
vim.keymap.set('n', '[L', ':lfirst<cr>')
vim.keymap.set('n', ']L', ':llast<cr>')
vim.keymap.set('n', 'gl]', 'g]<cr>:ltag<cr>:VList<cr><cr>')

-- tags
vim.keymap.set('n', '<leader>t', ':!t<cr>')
vim.keymap.set('n', '[t', ':tprevious<cr>')
vim.keymap.set('n', ']t', ':tnext<cr>')
vim.keymap.set('n', '[T', ':tfirst<cr>')
vim.keymap.set('n', '[tw', ':ptprevious<cr>')
vim.keymap.set('n', ']tw', ':ptnext<cr>')
vim.keymap.set('n', '[TW', ':ptfirst<cr>')
vim.keymap.set('n', ']TW', ':ptlast<cr>')

-- buffer toggle
vim.keymap.set('n', '<leader>b', '<c-^')
vim.keymap.set('n', '[b', ':bprevious<cr>')
vim.keymap.set('n', ']b', ':bnext<cr>')
vim.keymap.set('n', '[B', ':bfirst<cr>')
vim.keymap.set('n', ']B', ':blast<cr>')

-- grep
vim.keymap.set('n', '<leader>g', '<cmd>grep -g !tags<space><C-r><C-w><cr><cmd>QFix 0 0<cr><cr>')
vim.keymap.set('n', '<leader>r', ':grep ', { noremap = true })
vim.keymap.set('n', '<leader>lg', '<cmd>lgrep -g !tags<space><C-r><C-w><cr><cmd>QFix 0 0<cr><cr>')
vim.keymap.set('n', '<leader>lr', ':lgrep ', { noremap = true }) 
-- fzf grep results
vim.keymap.set('n', '<leader>s', ':Rg ')

-- notes
vim.keymap.set('n', '<leader>ncd', ':cd ~/docs/notes/<cr>')
-- ripgrep notes
vim.keymap.set('n', '<leader>ng', ':cd ~/docs/notes/<cr>:Ngrep<space<C-r><C-w><cr>:QFix 1 0<cr><cr>')
vim.keymap.set('n', '<leader>nr', ':cd ~/docs/notes/<cr>:Ngrep ')
-- fzf notes (multi-tag)
vim.keymap.set('n', '<Leader>ns', ':cd ~/docs/notes/<CR>:Nf (\\v<^|\\s>)@(\\w\\S*)<CR>', { noremap = true, silent = true })
-- new note
vim.keymap.set('n', '<leader>nn', ':NewNote')
-- note link
vim.keymap.set('n', '<Leader>nl', function()
  vim.fn['fzf#run']({ sink = 'HandleFZF', down = '25%' })
end, { noremap = true, silent = true })
-------------------------------------------------------------------------------
--
-- autocommands
--
-------------------------------------------------------------------------------
-- highlight yanked text
vim.api.nvim_create_autocmd(
	'TextYankPost',
	{
		pattern = '*',
		command = 'silent! lua vim.highlight.on_yank({ timeout = 500 })'
	}
)
-- jump to last edit position on opening file
vim.api.nvim_create_autocmd(
	'BufReadPost',
	{
		pattern = '*',
		callback = function(ev)
			if vim.fn.line("'\"") > 1 and vim.fn.line("'\"") <= vim.fn.line("$") then
				-- except for in git commit messages
				-- https://stackoverflow.com/questions/31449496/vim-ignore-specifc-file-in-autocommand
				if not vim.fn.expand('%:p'):find('.git', 1, true) then
					vim.cmd('exe "normal! g\'\\""')
				end
			end
		end
	}
)
-- prevent accidental writes to buffers that shouldn't be edited
vim.api.nvim_create_autocmd('BufRead', { pattern = '*.orig', command = 'set readonly' })
vim.api.nvim_create_autocmd('BufRead', { pattern = '*.pacnew', command = 'set readonly' })
-- leave paste mode when leaving insert mode (if it was on)
vim.api.nvim_create_autocmd('InsertLeave', { pattern = '*', command = 'set nopaste' })
-- help filetype detection (add as needed)
--vim.api.nvim_create_autocmd('BufRead', { pattern = '*.ext', command = 'set filetype=someft' })
-- shorter columns in text because it reads better that way
--
--- tex has so much syntax that a little wider is ok
vim.api.nvim_create_autocmd('Filetype', {
	pattern = 'tex',
	group = text,
	command = 'setlocal spell tw=80 colorcolumn=81',
})


-------------------------------------------------------------------------------
--
-- plugin configuration
--
-------------------------------------------------------------------------------
-- plugin manager
-- https://github.com/folke/lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
	-- main color scheme
	{
		'folke/tokyonight.nvim',
		--lazy = false,
		--priority = 1000,
		--config = function()
		--  vim.cmd([[colorscheme tokyonight-moon]])
		--end
	},
	{
		'Mofiqul/dracula.nvim',
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme dracula]])
		end
	},
	{
		'catppuccin/nvim',
		-- lazy = false,
		-- priority = 1000,
		-- config = function()
		-- 	vim.cmd([[colorscheme catppuccin]])
		-- end
	},
	{
		'itchyny/lightline.vim',
		lazy = false, -- also load at start since it's UI
		config = function()
			-- no need to also show mode in cmd line when we have bar
			vim.o.showmode = false
			vim.g.lightline = {
				active = {
					left = {
						{ 'mode', 'paste' },
						{ 'readonly', 'filename', 'modified' }
					},
					right = {
						{ 'lineinfo' },
						{ 'percent' },
						{ 'fileencoding', 'filetype' }
					},
				},
				component_function = {
					filename = 'LightlineFilename'
				},
			}
			function LightlineFilenameInLua(opts)
				if vim.fn.expand('%:t') == '' then
					return '[No Name]'
				else
					return vim.fn.getreg('%')
				end
			end
			-- https://github.com/itchyny/lightline.vim/issues/657
			vim.api.nvim_exec(
				[[
				function! g:LightlineFilename()
					return v:lua.LightlineFilenameInLua()
				endfunction
				]],
				true
			)
		end
	},
	-- quick navigation
	{
		'ggandor/leap.nvim',
		config = function()
			require('leap').create_default_mappings()
		end
	},
	-- better %
	{
		'andymass/vim-matchup',
		config = function()
			vim.g.matchup_matchparen_offscreen = { method = "popup" }
		end
	},
	-- auto-cd to root of git project
	-- 'airblade/vim-rooter'
	{
		'notjedi/nvim-rooter.lua',
		config = function()
			require('nvim-rooter').setup()
		end
	},
	-- fzf 
	{
		'junegunn/fzf'
	},
	{
		'junegunn/fzf.vim',
		-- TODO: when invoking ':Files' twice upon the second invocation the
		-- search box is empty
		-- config = function()
		-- 	-- stop putting a giant window over my editor
		-- 	vim.g.fzf_layout = { down = '~25%' }
		-- 	-- when using :Files, pass the file list through
		-- 	--
		-- 	--   https://github.com/jonhoo/proximity-sort
		-- 	--
		-- 	-- to prefer files closer to the current file.
		-- 	function list_cmd()
		-- 		local base = vim.fn.fnamemodify(vim.fn.expand('%'), ':h:.:S')
		-- 		if base == '.' then
		-- 			-- if there is no current file,
		-- 			-- proximity-sort can't do its thing
		-- 			return 'fd --type file --follow'
		-- 		else
		-- 			return vim.fn.printf('fd --type file --follow | proximity-sort %s', vim.fn.shellescape(vim.fn.expand('%')))
		-- 		end
		-- 	end
		-- 	vim.api.nvim_create_user_command('Files', function(arg)
		-- 		vim.fn['fzf#vim#files'](arg.qargs, { source = list_cmd(), options = '--tiebreak=index' }, arg.bang)
		-- 	end, { bang = true, nargs = '?', complete = "dir" })
		-- end
	},
	-- LSP
	{
		'neovim/nvim-lspconfig',
		config = function()
			-- Setup language servers.
			local lspconfig = require('lspconfig')

			-- Rust
			lspconfig.rust_analyzer.setup {
				-- Server-specific settings. See `:help lspconfig-setup`
				settings = {
					["rust-analyzer"] = {
						cargo = {
							allFeatures = true,
						},
						imports = {
							group = {
								enable = false,
							},
						},
						completion = {
							postfix = {
								enable = false,
							},
						},
					},
				},
			}
			-- Go
			lspconfig.gopls.setup {}
			-- JS/TS
			lspconfig.tsserver.setup {}
			-- Python
			lspconfig.pylsp.setup {}
			-- C#
			lspconfig.omnisharp.setup {}
			-- Java
			lspconfig.jdtls.setup {}
			-- C/C++
			lspconfig.clangd.setup {}
			-- Markdown
			lspconfig.markdown_oxide.setup {}
			-- Solidity
			lspconfig.solidity_ls_nomicfoundation.setup {}

			-- Bash LSP
			local configs = require 'lspconfig.configs'
			if not configs.bash_lsp and vim.fn.executable('bash-language-server') == 1 then
				configs.bash_lsp = {
					default_config = {
						cmd = { 'bash-language-server', 'start' },
						filetypes = { 'sh' },
						root_dir = require('lspconfig').util.find_git_ancestor,
						init_options = {
							settings = {
								args = {}
							}
						}
					}
				}
			end
			if configs.bash_lsp then
				lspconfig.bash_lsp.setup {}
			end

			-- Global mappings.
			-- See `:help vim.diagnostic.*` for documentation on any of the below functions
			vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
			vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
			vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
			vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

			-- Use LspAttach autocommand to only map the following keys
			-- after the language server attaches to the current buffer
			vim.api.nvim_create_autocmd('LspAttach', {
				group = vim.api.nvim_create_augroup('UserLspConfig', {}),
				callback = function(ev)
					-- Enable completion triggered by <c-x><c-o>
					vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

					-- Buffer local mappings.
					-- See `:help vim.lsp.*` for documentation on any of the below functions
					local opts = { buffer = ev.buf }
					vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
					vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
					vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
					vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
					vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
					vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
					vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
					vim.keymap.set('n', '<leader>wl', function()
						print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
					end, opts)
					vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
					-- TODO: remap
					-- vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, opts)
					vim.keymap.set({ 'n', 'v' }, '<leader>a', vim.lsp.buf.code_action, opts)
					vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
					vim.keymap.set('n', '<leader>f', function()
						vim.lsp.buf.format { async = true }
					end, opts)

					local client = vim.lsp.get_client_by_id(ev.data.client_id)

					-- When https://neovim.io/doc/user/lsp.html#lsp-inlay_hint stabilizes
					-- *and* there's some way to make it only apply to the current line.
					-- if client.server_capabilities.inlayHintProvider then
					--     vim.lsp.inlay_hint(ev.buf, true)
					-- end

					-- None of this semantics tokens business.
					-- https://www.reddit.com/r/neovim/comments/143efmd/is_it_possible_to_disable_treesitter_completely/
					client.server_capabilities.semanticTokensProvider = nil
				end,
			})
		end
	},
	-- LSP-based code-completion
	{
		"hrsh7th/nvim-cmp",
		-- load cmp on InsertEnter
		event = "InsertEnter",
		-- these dependencies will only be loaded when cmp loads
		-- dependencies are always lazy-loaded unless specified otherwise
		dependencies = {
			'neovim/nvim-lspconfig',
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
		},
		config = function()
			local cmp = require'cmp'
			cmp.setup({
				snippet = {
					-- REQUIRED by nvim-cmp. get rid of it once we can
					expand = function(args)
						vim.fn["vsnip#anonymous"](args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					['<C-b>'] = cmp.mapping.scroll_docs(-4),
					['<C-f>'] = cmp.mapping.scroll_docs(4),
					['<C-Space>'] = cmp.mapping.complete(),
					['<C-e>'] = cmp.mapping.abort(),
					-- Accept currently selected item.
					-- Set `select` to `false` to only confirm explicitly selected items.
					['<CR>'] = cmp.mapping.confirm({ select = true }),
				}),
				sources = cmp.config.sources({
					{ name = 'nvim_lsp' },
				}, {
					{ name = 'path' },
				}),
				experimental = {
					ghost_text = true,
				},
			})

			-- Enable completing paths in :
			cmp.setup.cmdline(':', {
				sources = cmp.config.sources({
					{ name = 'path' }
				})
			})
		end
	},
	-- treesitter
	{
		"nvim-treesitter/nvim-treesitter", 
		lazy = false,
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")
			configs.setup {
				ensure_installed = "all",
				highlight = {
					enable = true,
				},
				indent = {
					enable = true,
				},
				additional_vim_regex_highlighting = false,
			}
		end
	},
	-- inline function signatures
	{
		"ray-x/lsp_signature.nvim",
		event = "VeryLazy",
		opts = {},
		config = function(_, opts)
			-- Get signatures (and _only_ signatures) when in argument lists.
			require "lsp_signature".setup({
				doc_lines = 0,
				handler_opts = {
					border = "none"
				},
			})
		end
	},
	-- language support
	-- svelte
	{
		'evanleck/vim-svelte',
		ft = { "svelte" },
	},
	-- toml
	'cespare/vim-toml',
	-- yaml
	{
		"cuducos/yaml.nvim",
		ft = { "yaml" },
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
	},
	-- rust
	{
		'rust-lang/rust.vim',
		ft = { "rust" },
		config = function()
			vim.g.rustfmt_autosave = 1
			vim.g.rustfmt_emit_files = 1
			vim.g.rustfmt_fail_silently = 0
			vim.g.rust_clip_command = 'wl-copy'
		end
	},
	-- fish
	'khaveesh/vim-fish-syntax',
	-- markdown
	{
		'plasticboy/vim-markdown',
		ft = { "markdown" },
		dependencies = {
			'godlygeek/tabular',
		},
		config = function()
			-- never ever fold!
			vim.g.vim_markdown_folding_disabled = 1
			-- support front-matter in .md files
			vim.g.vim_markdown_frontmatter = 1
			-- 'o' on a list item should insert at same level
			vim.g.vim_markdown_new_list_item_indent = 0
			-- don't add bullets when wrapping:
			-- https://github.com/preservim/vim-markdown/issues/232
			vim.g.vim_markdown_auto_insert_bullets = 0
		end
	},
})
