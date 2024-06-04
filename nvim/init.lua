-- always set leader first!
vim.keymap.set("n", "<Space>", "<Nop>", { silent = true })
vim.g.mapleader = " "

-------------------------------------------------------------------------------
--
-- preferences
--
-------------------------------------------------------------------------------
vim.opt.background = 'dark'
vim.o.termguicolors = true
vim.opt.foldenable = false
vim.opt.foldmethod = 'manual'
vim.opt.foldlevelstart = 99
vim.opt.clipboard = "unnamedplus"
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
vim.opt.expandtab = false
-- case-insensitive search/replace
vim.opt.ignorecase = true
-- unless uppercase in search term
vim.opt.smartcase = true
vim.opt.vb = true
vim.opt.colorcolumn = '80'
vim.api.nvim_create_autocmd('Filetype', { pattern = 'rust', command = 'set colorcolumn=100' })
vim.opt.listchars = 'tab:▏-,nbsp:¬,extends:»,precedes:«,trail:•'
vim.opt.list = true
vim.opt.cursorline = true

-------------------------------------------------------------------------------
--
-- hotkeys
--
-------------------------------------------------------------------------------
vim.keymap.set('', '<leader>o', '<cmd>Telescope find_files<cr>')
vim.keymap.set('n', '<leader>b', '<cmd>Telescope buffers<cr>')
vim.keymap.set('n', '<leader>t', '<cmd>Telescope tags<cr>')
vim.keymap.set('n', '<leader>m', '<cmd>Telescope marks<cr>')
vim.keymap.set('n', '<leader>j', '<cmd>Telescope jumplist<cr>')
vim.keymap.set('n', '<space>\'', '<cmd>Telescope registers<cr>')
vim.keymap.set('n', '<leader>`', '<cmd>Telescope<cr>')
vim.keymap.set('n', '<leader>c', ':cclose<cr>')
vim.keymap.set('n', '<leader>h', '<cmd>Telescope highlights<cr>')

vim.keymap.set('', 'H', '^')
vim.keymap.set('', 'L', '$')

vim.keymap.set('n', '<leader>p', '<cmd>read !xsel --clipboard --output<cr>')
vim.keymap.set('v', '<leader>y', '"+y')

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

vim.keymap.set('n', '<up>', '<nop>')
vim.keymap.set('n', '<down>', '<nop>')
vim.keymap.set('i', '<up>', '<nop>')
vim.keymap.set('i', '<down>', '<nop>')
vim.keymap.set('i', '<left>', '<nop>')
vim.keymap.set('i', '<right>', '<nop>')
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')

-- quickfix
vim.keymap.set('n', '<leader>q', '<cmd>QFix 1 1<cr>')
vim.keymap.set('n', '<leader>Q', '<cmd>QFix 0 1<cr>')
vim.keymap.set('n', '[q', '<cmd>cprev<cr>')
vim.keymap.set('n', ']q', '<cmd>cnext<cr>')
vim.keymap.set('n', '[Q', '<cmd>cfirst<cr>')
vim.keymap.set('n', ']Q', '<cmd>clast<cr>')

-- location list
vim.keymap.set('n', '<leader>l', ':LList 1 1<cr>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>L', ':LList 0 1<cr>', { noremap = true, silent = true })
vim.keymap.set('n', '[l', ':lprev<cr>')
vim.keymap.set('n', ']l', ':lnext<cr>')
vim.keymap.set('n', '[L', ':lfirst<cr>')
vim.keymap.set('n', ']L', ':llast<cr>')
--vim.keymap.set('n', 'gl]', 'g]<cr>:ltag<cr>:VList<cr><cr>')

-- tags
--vim.keymap.set('n', '<leader>t', ':!t<cr>')
--vim.keymap.set('n', '[t', ':tprevious<cr>')
--vim.keymap.set('n', ']t', ':tnext<cr>')
--vim.keymap.set('n', '[T', ':tfirst<cr>')
--vim.keymap.set('n', '[tw', ':ptprevious<cr>')
--vim.keymap.set('n', ']tw', ':ptnext<cr>')
--vim.keymap.set('n', '[TW', ':ptfirst<cr>')
--vim.keymap.set('n', ']TW', ':ptlast<cr>')

-- buffer toggle
vim.keymap.set('n', '<leader>b', ':Telescope buffers<cr>')
vim.keymap.set('n', '[b', ':bprevious<cr>')
vim.keymap.set('n', ']b', ':bnext<cr>')
vim.keymap.set('n', '[B', ':bfirst<cr>')
vim.keymap.set('n', ']B', ':blast<cr>')

-- grep
vim.keymap.set('n', '<leader>g', ':grep -g !tags <C-r><C-w><cr><cr><cmd>QFix 1 1<cr><cr>')
vim.keymap.set('v', '<leader>g', ':grep -g !tags <C-r><C-w><cr><cr><cmd>QFix 1 1<cr><cr>')
vim.keymap.set('n', '<leader>G', ':Telescope live_grep<CR>')
vim.keymap.set('n', ']/', ':Telescope current_buffer_fuzzy_find<CR>')

-- notes
vim.keymap.set('n', '<leader>ncd', ':cd ~/docs/notes/<cr>')
-- ripgrep notes
vim.keymap.set('n', '<leader>ng', ':cd ~/docs/notes/<cr>:Ngrep<space<C-r><C-w><cr>:QFix 1 0<cr><cr>')
vim.keymap.set('n', '<leader>nr', ':cd ~/docs/notes/<cr>:Ngrep ')
-- fzf notes (multi-tag)
vim.keymap.set('n', '<Leader>ns', ':cd ~/docs/notes/<cr>:Nf (\\v<^|\\s>)@(\\w\\S*)<CR>',
  { noremap = true, silent = true })
-- new note
vim.keymap.set('n', '<leader>nn', ':NewNote')
-- note link
-- TODO: Update for telescope
--vim.keymap.set('n', '<Leader>nl', function()
--  vim.fn['fzf#run']({ sink = 'HandleFZF', down = '25%' })
--end, { noremap = true, silent = true })

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
  local args = vim.split(opts.args, " ")
  local v = tonumber(args[1]) or 0 -- Convert the first argument to a number
  local e = tonumber(args[2]) or (opts.bang and 1 or 0)
  QFixToggle(v, e)
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
  local args = vim.split(opts.args, " ")
  local v = tonumber(args[1]) or 0
  local e = tonumber(args[2]) or (opts.bang and 1 or 0)
  LListToggle(v, e)
end, { nargs = '*', bang = true })

-- Check if "rg" is executable and set  repprg and grepformat if it is
if vim.fn.executable("rg") == 1 then
  vim.o.grepprg = "rg --vimgrep --no-heading (commandline -q)"
  vim.o.grepformat = "%f:%l:%c:%m,%f:%l:%m"
end

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

-- Note grep
vim.api.nvim_create_user_command('Ngrep', function(opts)
  local command = string.format('grep "%s" -g "*.md" %s', opts.args, vim.fn.expand('$NOTES'))
  vim.cmd(command)
end, { nargs = 1 })

-------------------------------------------------------------------------------
--
-- autocommands
--
-------------------------------------------------------------------------------
vim.api.nvim_create_autocmd("QuickFixCmdPost", {
  callback = function()
    vim.cmd('VFix')
  end
})

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
    callback = function(_)
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
--- tex has so much syntax that a little wider is ok
vim.api.nvim_create_autocmd('Filetype', {
  pattern = 'tex',
  group = text,
  command = 'setlocal spell tw=80 colorcolumn=81',
})

-- set python path and virtual env when detecting .py files
-- only works in the root directory of the project
local function pyss()
  local handle = io.popen('$HOME/bin/pyss')
  local output = handle:read("*a")
  handle:close()

  local lines = {}
  for line in output:gmatch("[^\r\n]+") do
    table.insert(lines, line)
  end

  local py1 = lines[1] or ""
  local py2 = lines[2] or ""

  -- Trim any trailing newline or spaces from the selected lines
  py1 = py1:gsub("%s+$", "")
  py2 = py2:gsub("%s+$", "")

  if py1 ~= "" then
    vim.fn.setenv('PYTHONPATH', py1)
  end
  if py2 ~= "" then
    vim.fn.setenv('VIRTUAL_ENV', py2)
  end
end

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'python',
  callback = function() pyss() end,
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
  -- main colour scheme
  {
    'catppuccin/nvim',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme catppuccin]])
    end
  },
  'folke/tokyonight.nvim',
  'Mofiqul/dracula.nvim',
  {
    'nvim-lualine/lualine.nvim',
    lazy = false,
    config = function()
      local lualine = require('lualine')
      lualine.setup {
        options = {
          icons_enabled = true,
          theme = 'auto',
          component_separators = { left = '', right = '' },
          section_separators = { left = '', right = '' },
          disabled_filetypes = {
            statusline = {},
            winbar = {},
          },
          ignore_focus = {},
          always_divide_middle = true,
          globalstatus = false,
          refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
          }
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch', 'diff', 'diagnostics' },
          lualine_c = { 'filename' },
          lualine_x = { 'encoding', 'fileformat', 'filetype' },
          lualine_y = { 'progress' },
          lualine_z = { 'location' }
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { 'filename' },
          lualine_x = { 'location' },
          lualine_y = {},
          lualine_z = {}
        },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = {}
      }
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
  -- FZF
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-fzf-native.nvim',
    },
    config = function()
      local actions = require('telescope.actions')
      require('telescope').setup {
        defaults = {
          mappings = {
            i = {
              ["<esc>"] = actions.close,
              -- this isn't working cannot find workaround
              ["<C-x>"] = actions.send_selected_to_qflist,
            },
          },
        },
      }
    end
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
      lspconfig.pylsp.setup {
        settings = {
          pylsp = {
            plugins = {
              pylsp_mypy = {
                enabled = true,
                live_mode = true,
              },
              pylsp_black = {
                enabled = true
              },
              pylsp_ruff = {
                enabled = true
              },
              pylsp_isort = {
                enabled = true
              },
              jedi = {
                enabled = true,
                environment = os.getenv('VIRTUAL_ENV') or os.getenv('CONDA_PREFIX')
              }
            }
          }
        }
      }
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
      -- Lua
      lspconfig.lua_ls.setup {
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
          }
        }
      }

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

      vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
      vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
      vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
      vim.keymap.set('n', '<leader>d', vim.diagnostic.setloclist)

      -- Use LspAttach autocommand to only map the following keys
      -- after the language server attaches to the current buffer
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          -- Enable completion triggered by <c-x><c-o>
          vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

          local opts = { buffer = ev.buf }
          vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
          vim.keymap.set('n', 'gs', vim.lsp.buf.document_symbol, opts)
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
          vim.keymap.set('n', 'gD', vim.lsp.buf.type_definition, opts)
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
          vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
          vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
          vim.keymap.set({ 'n', 'v' }, '<leader>a', vim.lsp.buf.code_action, opts)
          vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, opts)
          vim.keymap.set('n', '<leader>f', function()
            vim.lsp.buf.format { async = true }
          end, opts)

          local client = vim.lsp.get_client_by_id(ev.data.client_id)

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
    dependencies = {
      'neovim/nvim-lspconfig',
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
    },
    config = function()
      local cmp = require 'cmp'
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
          ['<CR>'] = cmp.mapping.confirm({ select = false }),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
        }, {
          { name = 'path' },
        }),
        --experimental = {
        --  ghost_text = true,
        --},
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
    config = function(_, _)
      -- Get signatures (and _only_ signatures) when in argument lists.
      require "lsp_signature".setup({
        cfg = {
          bind = true, -- This is mandatory, otherwise border config won't get registered.
          doc_lines = 10, -- will show two lines of comment/doc(if there are more than two lines in doc, will be truncated);
          -- set to 0 if you DO NOT want any API comments be shown
          -- This setting only take effect in insert mode, it does not affect signature help in normal
          -- mode, 10 by default
          max_height = 12, -- max height of signature floating_window
          max_width = 80, -- max_width of signature floating_window, line will be wrapped if exceed max_width
          -- the value need >= 40
          wrap = true, -- allow doc/signature text wrap inside floating_window, useful if your lsp return doc/sig is too long
          floating_window = true,
          floating_window_above_cur_line = true, -- try to place the floating above the current line when possible Note:
          -- will set to true when fully tested, set to false will use whichever side has more space
          -- this setting will be helpful if you do not want the PUM and floating win overlap
          floating_window_off_x = 1, -- adjust float windows x position.
          -- can be either a number or function
          floating_window_off_y = 0, -- adjust float windows y position. e.g -2 move window up 2 lines; 2 move down 2 lines
          -- can be either number or function, see examples
          close_timeout = 4000, -- close floating window after ms when laster parameter is entered
          fix_pos = false, -- set to true, the floating window will not auto-close until finish all parameters
          hint_enable = true, -- virtual hint enable
          hint_prefix = "🐼 ", -- Panda for parameter, NOTE: for the terminal not support emoji, might crash
          -- or, provide a table with 3 icons
          -- hint_prefix = {
          --     above = "↙ ",  -- when the hint is on the line above the current line
          --     current = "← ",  -- when the hint is on the same line
          --     below = "↖ "  -- when the hint is on the line below the current line
          -- }
          hint_scheme = "String",
          hint_inline = function() return false end, -- should the hint be inline(nvim 0.10 only)?  default false
          hi_parameter = "LspSignatureActiveParameter", -- how your parameter will be highlight
          handler_opts = {
            border = "single" -- double, rounded, single, shadow, none, or a table of borders
          },
          always_trigger = true, -- sometime show signature on new line or in middle of parameter can be confusing, set it to false for #58
          auto_close_after = nil, -- autoclose signature float win after x sec, disabled if nil.
          zindex = 200, -- by default it will be on top of all floating windows, set to <= 50 send it to bottom
          padding = '', -- character to pad on left and right of signature can be ' ', or '|'  etc
          transparency = 100, -- disabled by default, allow floating win transparent value 1~100
          timer_interval = 0,                     -- default timer check interval set to lower value if you want to reduce latency
          toggle_key_flip_floatwin_setting = false, -- true: toggle floating_windows: true|false setting after toggle key pressed
          -- false: floating_windows setup will not change, toggle_key will pop up signature helper, but signature
          -- may not popup when typing depends on floating_window setting
          select_signature_key = nil, -- cycle to next signature, e.g. '<M-n>' function overloading
          keymaps = {}, -- relate to move_cursor_key; the keymaps inside floating window, e.g. keymaps = { 'j', '<C-o>j' } this map j to <C-o>j in floating window
        }
      })
    end
  },
  -- language support
  {
    "sheerun/vim-polyglot"
  },
  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
  },
  {
    'github/copilot.vim'
  },
})
