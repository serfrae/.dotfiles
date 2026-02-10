-- Check if "rg" is executable and set  repprg and grepformat if it is
if vim.fn.executable("rg") == 1 then
    vim.o.grepprg = "rg --vimgrep --no-heading (commandline -q)"
    vim.o.grepformat = "%f:%l:%c:%m,%f:%l:%m"
end

vim.api.nvim_create_autocmd('FileType', {
    pattern = 'qf',
    callback = function()
        vim.opt_local.wrap = false
        vim.opt_local.number = false
        vim.opt_local.relativenumber = false
    end,
})

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
        cmd = 'rg --files --hidden --ignore ' .. vim.fn.expand('$NOTES'),
        actions = {
            ['default'] = insert_link_action,
        },
    }

    local fzf = require('fzf-lua')
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
