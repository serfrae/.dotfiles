vim.keymap.set('', 'H', '^')
vim.keymap.set('', 'L', '$')

vim.keymap.set('n', '<leader>w', '<cmd>w<cr>')
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
vim.keymap.set('n', ',m', '<cmd>FzfLua marks<cr>')

--grug
vim.keymap.set('n', ',g', ':GrugFar<cr>')
vim.keymap.set('n', ',G', ':GrugFarWithin<cr>')

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
vim.keymap.set('n', '[q', '<cmd>cprev<cr>')
vim.keymap.set('n', ']q', '<cmd>cnext<cr>')
vim.keymap.set('n', '[Q', '<cmd>cfirst<cr>')
vim.keymap.set('n', ']Q', '<cmd>clast<cr>')
--
-- -- location list
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
vim.keymap.set('n', ',T', ':tabclose<cr>')

--resize
vim.keymap.set('n', '<C-S-l>', ':resize +2<cr>')
vim.keymap.set('n', '<C-S-h>', ':resize -2<cr>')
vim.keymap.set('n', '<C-S-j>', ':vertical resize +2<cr>')
vim.keymap.set('n', '<C-S-k>', ':vertical resize -2<cr>')

-- note link
vim.api.nvim_set_keymap('n', '<leader>nl', '<cmd>lua NoteLink()<cr>', { noremap = true, silent = true })

-- global marks
local function merge_tables(t1, t2)
    local result = {}
    for key, value in pairs(t1) do
        result[key] = value
    end
    for key, value in pairs(t2) do
        result[key] = value
    end
    return result
end

local keymap_opts = { noremap = true, silent = true }

local keymap_set = function(mode, lhs, rhs, desc)
    vim.keymap.set(mode, lhs, rhs, merge_tables(keymap_opts, { desc = desc }))
end

local prefixes = "m'"
local letters = "abcdefghijklmnopqrstuvwxyz"
for i = 1, #prefixes do
    local prefix = prefixes:sub(i, i)
    for j = 1, #letters do
        local lower_letter = letters:sub(j, j)
        local upper_letter = string.upper(lower_letter)
        keymap_set({ "n", "v" }, prefix .. lower_letter, prefix .. upper_letter, "Mark " .. upper_letter)
    end
end
