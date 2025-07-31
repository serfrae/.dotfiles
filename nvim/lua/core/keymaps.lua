vim.keymap.set('', 'H', '^')
vim.keymap.set('', 'L', '$')

vim.keymap.set('n', '<leader>p', '<cmd>read !pbpaste<cr>')
vim.keymap.set('v', '<leader>y', '"+y')
vim.keymap.set('n', '<S-z><S-x>', ':q!<cr>')

-- fzf
vim.keymap.set('n', '<leader><leader>', '<cmd>FzfLua resume<cr>')
vim.keymap.set('n', '<leader>o', '<cmd>FzfLua files<cr>')
vim.keymap.set('n', '<leader>`', '<cmd>FzfLua<cr>')
vim.keymap.set('n', '<leader>g', '<cmd>FzfLua live_grep<cr>')
vim.keymap.set('n', 'gr', '<cmd>FzfLua lsp_references<CR>', { nowait = true })
vim.keymap.set('n', 'gi', '<cmd>FzfLua lsp_implementations<CR>')

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

-- split navigation
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Move focus to the left split' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Move focus to the right split' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Move focus to the lower split' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Move focus to the upper split' })

-- quickfix
-- vim.keymap.set('n', '<leader>q', '<cmd>QFix 1 1<cr>')
-- vim.keymap.set('n', '<leader>Q', '<cmd>QFix 0 1<cr>')
vim.keymap.set('n', '[q', '<cmd>cprev<cr>')
vim.keymap.set('n', ']q', '<cmd>cnext<cr>')
vim.keymap.set('n', '[Q', '<cmd>cfirst<cr>')
vim.keymap.set('n', ']Q', '<cmd>clast<cr>')
--
-- -- location list
-- vim.keymap.set('n', '<leader>l', ':LList 1 1<cr>', { noremap = true, silent = true })
-- vim.keymap.set('n', '<leader>L', ':LList 0 1<cr>', { noremap = true, silent = true })
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
vim.keymap.set('n', '<leader>t', ':FzfLua tabs<cr>')
vim.keymap.set('n', ',t', ':tabnew<cr>')
vim.keymap.set('n', '[t', ':tabprevious<cr>')
vim.keymap.set('n', ']t', ':tabnext<cr>')
vim.keymap.set('n', '[T', ':tabfirst<cr>')
vim.keymap.set('n', ']T', ':tablast<cr>')

--resize
vim.keymap.set('n', '<C-S-l>', ':resize +2<cr>')
vim.keymap.set('n', '<C-S-h>', ':resize -2<cr>')
vim.keymap.set('n', '<C-S-j>', ':vertical resize +2<cr>')
vim.keymap.set('n', '<C-S-k>', ':vertical resize -2<cr>')

-- notes
vim.keymap.set('n', '<leader>ncd', ':cd ~/Notes<cr>')
-- ripgrep notes
vim.keymap.set('n', '<leader>ng', ':cd ~/Notes/<cr>:Ngrep<space><C-r><C-w><cr>:QFix 1 0<cr><cr>')
vim.keymap.set('n', '<leader>nr', ':cd ~/Notes/<cr>:Ngrep ')
-- new note
vim.keymap.set('n', '<leader>nn', ':NewNote')
-- note link
vim.api.nvim_set_keymap('n', '<leader>nl', '<cmd>lua NoteLink()<cr>', { noremap = true, silent = true })
-- note find
vim.api.nvim_set_keymap('n', '<leader>nf', '<cmd>lua NoteFind()<cr>', { noremap = true, silent = true })

-- DAP
vim.keymap.set('n', ',dd', '<cmd>lua require("dapui").toggle()<CR>')
vim.keymap.set('n', ',ds', ':DapStepOver<CR>')
vim.keymap.set('n', ',dt', ':DapTerminate<CR>')
vim.keymap.set('n', ',dc', ':DapContinue<CR>')
vim.keymap.set('n', ',db', ':DapToggleBreakpoint<CR>')
