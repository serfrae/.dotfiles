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
end)
