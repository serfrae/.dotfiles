-- open quickfix/location list in Trouble
vim.api.nvim_create_autocmd("FileType", {
  pattern = "qf",
  callback = function()
    vim.schedule(function()
      if vim.fn.getloclist(0, { filewinid = 0 }).filewinid ~= 0 then
        vim.cmd.lclose()
        vim.cmd("Trouble loclist open")
      else
        vim.cmd.cclose()
        vim.cmd("Trouble qflist open")
      end
    end)
  end,
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
