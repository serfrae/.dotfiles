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

vim.api.nvim_create_autocmd('FileType', {
    pattern = 'qf',
    callback = function()
        vim.opt_local.wrap = false
        vim.opt_local.number = false
        vim.opt_local.relativenumber = false
    end,
})

-- NewNote
function NewNote(name)
    -- Format the filename using the provided name and the current date/time
    local filename = name
    local filepath = vim.fn.expand('$NOTES/') .. '/' .. os.date('%Y%m%d%H%M') .. '-' .. filename .. '.md'

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

function NoteFind()
    local note_path = os.getenv("NOTES")
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
        cwd = note_path, -- Set the working directory for the command
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
