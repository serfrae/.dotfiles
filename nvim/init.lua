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
vim.opt.expandtab = true
-- case-insensitive search/replace
vim.opt.ignorecase = true
-- unless uppercase in search term
vim.opt.smartcase = true
vim.opt.vb = true
vim.opt.colorcolumn = '80'
vim.api.nvim_create_autocmd('Filetype', { pattern = 'rust', command = 'set colorcolumn=100' })
vim.opt.listchars = 'tab:▏-,nbsp:¬,extends:»,precedes:«,trail:•,multispace:▏---'
vim.opt.list = true
vim.opt.cursorline = true
vim.opt.tags = './tags;,tags'

-------------------------------------------------------------------------------
--
-- hotkeys
--
-------------------------------------------------------------------------------
vim.keymap.set('n', '<leader>o', '<cmd>FzfLua files<cr>')
vim.keymap.set('n', '<leader>i', '<cmd>:Oil<cr>')
vim.keymap.set('n', '<leader>st', '<cmd>FzfLua tags<cr>')
vim.keymap.set('n', '<leader>sd', '<cmd>FzfLua lsp_document_symbols<cr>')
vim.keymap.set('n', '<leader>sw', '<cmd>FzfLua lsp_workspace_symbols<cr>')
vim.keymap.set('n', '<leader>wd', '<cmd> FzfLua lsp_workspace_diagnostics<cr>')
vim.keymap.set('n', '<leader>`', '<cmd>FzfLua<cr>')
vim.keymap.set('n', '<leader>c', ':close<cr>')

vim.keymap.set('', 'H', '^')
vim.keymap.set('', 'L', '$')

vim.keymap.set('n', '<leader>p', '<cmd>read !pbpaste<cr>')
vim.keymap.set('v', '<leader>y', '"+y')
vim.keymap.set('n', '<S-z><S-x>', ':q!<cr>')

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

-- buffer toggle
vim.keymap.set('n', '<leader>b', ':FzfLua buffers<cr>')
vim.keymap.set('n', '[b', ':bprevious<cr>')
vim.keymap.set('n', ']b', ':bnext<cr>')
vim.keymap.set('n', '[B', ':bfirst<cr>')
vim.keymap.set('n', ']B', ':blast<cr>')

-- tab toggle
vim.keymap.set('n', '<leader>t', ':tabnew<cr>')
vim.keymap.set('n', '[t', ':tabprevious<cr>')
vim.keymap.set('n', ']t', ':tabnext<cr>')
vim.keymap.set('n', '[T', ':tabfirst<cr>')
vim.keymap.set('n', ']T', ':tablast<cr>')

-- grep
vim.keymap.set('n', '<leader>g', ':FzfLua live_grep<CR>')
vim.keymap.set('v', '<leader>g', ':FzfLua live_grep<CR>')
vim.keymap.set('n', '<leader>/', ':FzfLua lgrep_curbuf<CR>')

--resize
vim.keymap.set('n', '<C-S-l>', ':resize +2<cr>')
vim.keymap.set('n', '<C-S-h>', ':resize -2<cr>')
vim.keymap.set('n', '<C-S-j>', ':vertical resize +2<cr>')
vim.keymap.set('n', '<C-S-k>', ':vertical resize -2<cr>')

-- notes
vim.keymap.set('n', '<leader>ncd', ':cd ~/docs/notes/<cr>')
-- ripgrep notes
vim.keymap.set('n', '<leader>ng', ':cd ~/docs/notes/<cr>:Ngrep<space><C-r><C-w><cr>:QFix 1 0<cr><cr>')
vim.keymap.set('n', '<leader>nr', ':cd ~/docs/notes/<cr>:Ngrep ')
-- new note
vim.keymap.set('n', '<leader>nn', ':NewNote')
-- note link
vim.api.nvim_set_keymap('n', '<leader>nl', '<cmd>lua NoteLink()<cr>', { noremap = true, silent = true })
-- note find
vim.api.nvim_set_keymap('n', '<leader>nf', '<cmd>lua NoteFind()<cr>', { noremap = true, silent = true })

vim.keymap.set('n', '<M-S-l>', ':vertical resize +2<cr>')
vim.keymap.set('n', '<M-S-h>', ':vertical resize -2<cr>')
vim.keymap.set('n', '<M-S-j>', ':resize +2<cr>')
vim.keymap.set('n', '<M-S-k>', ':resize -2<cr>')

-------------------------------------------------------------------------------
--
-- functions
--
-------------------------------------------------------------------------------
-- Quickfix Toggle
vim.api.nvim_create_user_command('VFix', function()
    vim.cmd('cclose')
    vim.cmd('botright vertical copen')
    vim.cmd('wincmd L')
    vim.cmd('vertical resize 50')
end, {})

function QFixToggle(v, e)
    local qfix = vim.fn.getqflist()
    if #qfix == 0 then
        vim.api.nvim_echo({ { "QFix empty", "WarningMessage" } }, false, {})
        return
    end
    if vim.g.qfix_win and e == 1 then
        vim.cmd('cclose')
        vim.g.qfix_win = nil
    else
        if v == 0 then
            vim.cmd('copen')
        else
            vim.cmd('VFix')
        end
        vim.g.qfix_win = vim.api.nvim_get_current_win()
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
    vim.cmd('cclose')
    vim.cmd('botright vertical lopen')
    vim.cmd('wincmd L')
    vim.cmd('vertical resize 50')
end, {})

function LListToggle(v, e)
    local loclist = vim.fn.getloclist(0)
    if #loclist == 0 then
        vim.api.nvim_echo({ { "Loclist empty", "WarningMessage" } }, false, {})
        return
    end
    if vim.g.llist_win and e == 1 then
        vim.cmd('lclose')
        vim.g.llist_win = nil
    else
        if v == 0 then
            vim.cmd('lopen')
        else
            vim.cmd('VList')
        end
        vim.g.llist_win = vim.api.nvim_get_current_win()
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

_G.custom_qf_text = function(info)
    local items = vim.fn.getqflist({ id = info.id, items = 0 }).items
    local lines = {}
    local max_length = 0

    -- First pass: determine the maximum length of the combined indent, symbol type, and name
    for i = info.start_idx, info.end_idx do
        local item = items[i]
        if item then
            local text = item.text
            local indent = text:match("^(%s*)")
            local symbol_type = text:match("%[([^%s%]]+)")
            local symbol_name = text:match("%]%s*(.-)%s*$") or text
            local combined = indent .. (symbol_type or "") .. (symbol_type and " " or "") .. symbol_name
            max_length = math.max(max_length, vim.fn.strdisplaywidth(combined))
        end
    end

    -- Add 1 to max_length for the extra space
    max_length = max_length + 1

    -- Second pass: format the lines
    for i = info.start_idx, info.end_idx do
        local item = items[i]
        if item then
            local filename = vim.fn.bufname(item.bufnr)
            filename = vim.fn.fnamemodify(filename, ":t")
            local text = item.text

            local indent = text:match("^(%s*)")
            local symbol_type = text:match("%[([^%s%]]+)")
            local symbol_name = text:match("%]%s*(.-)%s*$") or text

            local combined = indent .. (symbol_type or "") .. (symbol_type and " " or "") .. symbol_name
            local padding = string.rep(" ", max_length - vim.fn.strdisplaywidth(combined))

            local line = string.format("%s%s| %s | [%d:%d]", combined, padding, filename, item.lnum, item.col)
            lines[#lines + 1] = line
        end
    end
    return lines
end

vim.api.nvim_create_autocmd('FileType', {
    pattern = 'qf',
    callback = function()
        vim.opt_local.wrap = false
        vim.opt_local.number = false
        vim.opt_local.relativenumber = false
    end,
})

-- Set the quickfixtextfunc option
vim.o.quickfixtextfunc = 'v:lua.custom_qf_text'
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

function NoteLink()
    function NoteLink()
        -- Define the action to take when a note is selected
        local insert_link_action = function(selected)
            -- Get the relative path to the selected note
            local full_note_path = selected[1]
            local note_path = vim.fn.fnamemodify(full_note_path, ':t')
            local date_pattern = ('%d'):rep(8) .. '%-'
            local date_pattern_ext = ('%d'):rep(12) .. '%-'
            local trimmed_note_path = note_path:gsub(date_pattern_ext, ''):gsub(date_pattern, '')
            local filename_without_ext = vim.fn.fnamemodify(trimmed_note_path, ':r')

            -- Insert the Markdown link at the cursor position
            vim.api.nvim_put({ '[ ' .. filename_without_ext .. ' ]' .. '( ' .. note_path .. ' )' }, 'l', true, true)
        end

        -- Configure the finder
        local opts = {
            prompt = 'Select note: ',
            cmd = 'rg --files --hidden --ignore ' .. vim.fn.expand('$HOME/docs/notes'),
            actions = {
                ['default'] = insert_link_action,
            },
        }

        local fzf = require('fzf-lua')
        fzf.fzf_exec(opts.cmd, opts)
    end
end

function NoteFind()
    local home = os.getenv("HOME")
    local docs_path = home .. "/docs/notes"
    local rg_cmd = "rg -e '(^|[[:space:]])#(\\w\\S*)' -g '!tags' --no-heading --line-number --color=always"

    local fzf = require('fzf-lua')

    -- Define the function to handle the selected note
    local function insert_link_action(selected)
        local result = selected[1]:gsub(":%d+:.*", "") -- Remove the line number and everything after it
        if result and result ~= "" then
            vim.api.nvim_command('edit ' .. result)
        end
    end

    -- Configure fzf-lua options
    local opts = {
        prompt = 'Select note: ',
        cwd = docs_path, -- Set the working directory for the command
        cmd = rg_cmd,
        previewer = "bat",
        actions = {
            ['default'] = insert_link_action,
        },
    }

    -- Execute fzf-lua with the specified options
    fzf.fzf_exec(opts.cmd, opts)
end

function MarkdownGf()
    local word = vim.fn.expand('<cword>')
    vim.fn.search(word, 'W')
    vim.api.nvim_command('normal! gf')
end

-- Map gf to the custom function in markdown files
vim.api.nvim_command('autocmd FileType markdown nnoremap <buffer> gf :lua MarkdownGf()<CR>')

-- Copilot Toggle
local copilot_on = true
vim.api.nvim_create_user_command("CopilotToggle", function()
    if copilot_on then
        vim.cmd("Copilot disable")
        print("Copilot OFF")
    else
        vim.cmd("Copilot enable")
        print("Copilot ON")
    end
    copilot_on = not copilot_on
end, {})
vim.keymap.set('', '<M-c>', ':CopilotToggle<cr>')

-- Code Companion
vim.keymap.set({ "n", "v" }, "<C-a>", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "<LocalLeader>a", "<cmd>CodeCompanionChat Toggle<cr>", { noremap = true, silent = true })
vim.keymap.set("v", "ga", "<cmd>CodeCompanionChat Add<cr>", { noremap = true, silent = true })

-- Expand 'cc' into 'CodeCompanion' in the command line
vim.cmd([[cab cc CodeCompanion]])
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
    ---@diagnostic disable-next-line: need-check-nil
    local output = handle:read("*a")
    ---@diagnostic disable-next-line: need-check-nil
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

local function workspace_diagnostics_to_loclist()
    local diagnostics = vim.diagnostic.get(nil, { severity = { min = vim.diagnostic.severity.HINT } })
    local items = vim.diagnostic.toqflist(diagnostics)
    vim.fn.setloclist(0, {}, ' ', { title = 'Workspace Diagnostics', items = items })
end


--- Workaround for Rust Analyzer https://github.com/neovim/neovim/issues/30985#issuecomment-2447329525
for _, method in ipairs({ 'textDocument/diagnostic', 'workspace/diagnostic' }) do
    local default_diagnostic_handler = vim.lsp.handlers[method]
    vim.lsp.handlers[method] = function(err, result, context, config)
        if err ~= nil and err.code == -32802 then
            return
        end
        return default_diagnostic_handler(err, result, context, config)
    end
end

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
            local bools = vim.api.nvim_get_hl(0, { name = 'Boolean' })
            vim.api.nvim_set_hl(0, 'Comment', bools)
        end
    },
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
                    lualine_c = { { 'filename', file_status = true, path = 1 } },
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
        'folke/flash.nvim',
        event = "VeryLazy",
        ---@diagnostic disable-next-line: undefined-doc-name
        ---@type Flash.Config,
        opts = {
            highlight = {
                -- The backdrop is a lot of visual noise
                backdrop = false,
                matches = true,
            },
            modes = {
                char = {
                    highlight = {
                        backdrop = false,
                    },
                },
            },
        },
        config = function(_, opts)
            require('flash').setup(opts)
            --vim.api.nvim_set_hl(0, 'FlashCursor', { fg = '#ffffff', bg = '#ff0000', bold = true })
            --vim.api.nvim_set_hl(0, 'FlashMatches', { fg = '#000000', bg = '#ffff00', bold = true })
            --vim.api.nvim_set_hl(0, 'FlashCurrent', { fg = '#ffffff', bg = '#0000ff', bold = true })
            vim.api.nvim_set_hl(0, 'FlashLabel', { link = 'lualine_a_insert', bold = true })
            -- Change the color codes (#ff0000 and #ffffff) to your desired colors
        end,
        -- stylua: ignore
        keys = {
            { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
            { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
            { "r", mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
            { "R", mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
        },
    },
    -- FZF
    {
        'ibhagwan/fzf-lua',
        config = function()
            require('fzf-lua').setup {
                fzf_opts = {
                    ['--cycle'] = ''
                },
                keymap = {
                    fzf = {
                        ["ctrl-a"] = "select-all+accept",
                        ["ctrl-s"] = {
                            fn = function(selected)
                                require('trouble').open({
                                    mode = "quickfix",
                                    items = vim.tbl_map(function(entry)
                                        local file, line, col, text = entry:match("([^:]+):(%d+):(%d+):(.*)")
                                        return {
                                            filename = file or entry,
                                            lnum = tonumber(line) or 1,
                                            col = tonumber(col) or 1,
                                            text = text or entry,
                                        }
                                    end, selected)
                                })
                            end
                        }
                    }
                },
                files = {
                    fd_opts = "--type f --hidden --follow --exclude .git --exclude node_modules --exclude .venv --exclude .mypy_cache"
                },
                actions = {
                    ["default"] = function(selected)
                        -- First, perform the default action (which varies depending on the search type)
                        actions.act(selected)

                        -- Then, schedule opening the quickfix window
                        vim.schedule(function()
                            -- Check if the quickfix list is not empty
                            if #vim.fn.getqflist() > 0 then
                                vim.cmd('VFix')
                            end
                        end)
                    end,
                }
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
                            -- Have to set to false for:
                            -- https://github.com/coral-xyz/anchor/issues/3042
                            allFeatures = false,
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
            lspconfig.ts_ls.setup {
                settings = {
                    typescript = {
                        format = {
                            indentSize = 4,
                            convertTabsToSpaces = true,
                        }
                    },
                    javascript = {
                        format = {
                            indentSize = 4,
                            convertTabsToSpaces = true,
                        }
                    }
                }
            }
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
                    --vim.keymap.set({ 'n', 'v' }, '<leader>a', vim.lsp.buf.code_action, opts)
                    vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, opts)
                    vim.keymap.set('n', '<leader>f', function()
                        vim.lsp.buf.format { async = true }
                    end, opts)

                    local client = vim.lsp.get_client_by_id(ev.data.client_id)

                    client.server_capabilities.semanticTokensProvider = nil
                end,
            })
        end
    },
    -- LSP-based code-completion
    {
        "hrsh7th/nvim-cmp",
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
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),
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
    {
        "stevearc/dressing.nvim",
        event = "VeryLazy",
    },
    {
        "folke/trouble.nvim",
        opts = {
            keys = {
                s = false
            },
        }, -- for default options, refer to the configuration section for custom setup.
        cmd = "Trouble",
        keys = {
            {
                "<leader>xx",
                "<cmd>Trouble diagnostics toggle<cr>",
                desc = "Diagnostics (Trouble)",
            },
            {
                "<leader>xX",
                "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
                desc = "Buffer Diagnostics (Trouble)",
            },
            {
                "<leader>cs",
                "<cmd>Trouble symbols toggle focus=false<cr>",
                desc = "Symbols (Trouble)",
            },
            {
                "<leader>cl",
                "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
                desc = "LSP Definitions / references / ... (Trouble)",
            },
            {
                "<leader>xL",
                "<cmd>Trouble loclist toggle<cr>",
                desc = "Location List (Trouble)",
            },
            {
                "<leader>xQ",
                "<cmd>Trouble qflist toggle<cr>",
                desc = "Quickfix List (Trouble)",
            },
        },
    },
    {
        "mikavilpas/yazi.nvim",
        event = "VeryLazy",
        keys = {
            -- 👇 in this section, choose your own keymappings!
            {
                "<leader>-",
                mode = { "n", "v" },
                "<cmd>Yazi<cr>",
                desc = "Open yazi at the current file",
            },
            {
                -- Open in the current working directory
                "<leader>cw",
                "<cmd>Yazi cwd<cr>",
                desc = "Open the file manager in nvim's working directory",
            },
            {
                -- NOTE: this requires a version of yazi that includes
                -- https://github.com/sxyazi/yazi/pull/1305 from 2024-07-18
                "<c-up>",
                "<cmd>Yazi toggle<cr>",
                desc = "Resume the last yazi session",
            },
        },
        opts = {
            -- if you want to open yazi instead of netrw, see below for more info
            open_for_directories = false,
            keymaps = {
                show_help = "<f1>",
            },
        },
    },
    {
        'stevearc/oil.nvim',
        opts = {},
        -- Optional dependencies
        dependencies = { { "echasnovski/mini.icons", opts = {} } },
        -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
    },
    {
        'github/copilot.vim'
    },
    {
        "olimorris/codecompanion.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            require("codecompanion").setup({
                strategies = {
                    chat = {
                        adapter = "anthropic",
                    },
                    inline = {
                        adapter = "anthropic",
                    },
                },
            })
        end
    },
})
