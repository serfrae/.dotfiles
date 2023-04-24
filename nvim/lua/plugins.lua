-- Mason Setup
require("mason").setup({
    ui = {
        icons = {
            package_installed = "",
            package_pending = "",
            package_uninstalled = "",
        },
    }
})
require("mason-lspconfig").setup()

--Rust tools
local rt = require("rust-tools")

rt.setup({
	server = {
		on_attach = function(_, bufnr)
			vim.keymap.set("n", "<leader>a", rt.hover_actions.hover_actions, { buffer = bufnr })
			vim.keymap.set("n", "<leader><C-a>", rt.code_action_group.code_action_group, { buffer = bufnr })
		end,
	},
})

-- LSP Diagnostics Options Setup 
local sign = function(opts)
  vim.fn.sign_define(opts.name, {
    texthl = opts.name,
    text = opts.text,
    numhl = ''
  })
end

sign({name = 'DiagnosticSignError', text = ''})
sign({name = 'DiagnosticSignWarn', text = ''})
sign({name = 'DiagnosticSignHint', text = ''})
sign({name = 'DiagnosticSignInfo', text = ''})

vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    update_in_insert = true,
    underline = true,
    severity_sort = false,
    float = {
        border = 'rounded',
        source = 'always',
        header = '',
        prefix = '',
    },
})

vim.cmd([[
set signcolumn=yes
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])

-- Plugins
return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use 'junegunn/fzf'
	use 'junegunn/fzf.vim'
	use 'rust-lang/rust.vim'
	use 'fatih/vim-go'
	use 'christoomey/vim-tmux-navigator'
	use 'chriskempson/base16-vim'
	use 'williamboman/mason.nvim'
	use 'williamboman/mason-lspconfig.nvim'
	use 'vim-airline/vim-airline'
	use 'vim-airline/vim-airline-themes'
	use 'neovim/nvim-lspconfig'
	use 'simrat39/rust-tools.nvim'
end)
