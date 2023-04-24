function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

function nmap(shortcut, command)
  map('n', shortcut, command)
end

function imap(shortcut, command)
  map('i', shortcut, command)
end

function vmap(shortcut, command)
	map('v', shortcut, command)
end

vim.g.mapleader=" "
vim.o.set listchars=tab:▸\ ,eol:↲,nbsp:␣,trail:•,precedes:←,extends:→

nmap("<leader>o", "<cmd>Files<cr>")
nmap("<leader>;", "<cmd>Buffers<cr>")
nmap("<leader>]", "<cmd>Tags<cr>")

-- Change directory to directory of the current file
nmap("<leader>cd", "<cmd>cd %:h<cr>")

-- Quickfix
nmap("]o", "<cmd>Qfix 1 1<cr>")
nmap("[o", "<cmd>Qfix 0 1<cr>")
nmap("[q", "<cmd>cprev<cr>")
nmap("]q", "<cmd>cnext<cr>")
nmap("[Q", "<cmd>cfirst<cr>")
nmap("]Q", "<cmd>clast<cr>")

-- Location list
nmap("[;", "<cmd>LList 0 1<cr>")
nmap("];", "<cmd>LList 11<cr>")
nmap("[l", "<cmd>lprev<cr>")
nmap("]l", "<cmd>lnext<cr>")
nmap("[L", "<cmd>lfirst<cr>")
nmap("]L", "<cmd>llast<cr>")

-- Open tags in LList
nmap("gl]", "g]<cr><cmd>ltag<cr><cmd>VList<cr><cr>")

-- Tags
-- Generate ctags
nmap("<leader>t", "<cmd>!t<cr>")
nmap("[t", "<cmd>tprevious<cr>")
nmap("]t", "<cmd>tnext<cr>")
nmap("[T", "<cmd>tfirst<cr>")
nmap("]T", "<cmd>tlast<cr>")
nmap("[tw", "<cmd>ptprevious<cr>")
nmap("]tw", "<cmd>ptnext<cr>")
nmap("[TW", "<cmd>ptfirst<cr>")
nmap("]TW", "<cmd>ptlast<cr>")

--Buffers
-- Toggle between buffers
nmap("<leader>b", "c-^")
nmap("[b", "<cmd>bprevious<cr>")
nmap("]b", "<cmd>bnext<cr>")
nmap("[B", "<cmd>bfirst<cr>")
nmap("]B", "<cmd>blast<cr>")

-- Navigation QOL
nmap("j", "gj")
nmap("k", "gk")
nmap("H", "g^")
nmap("L", "g$")
map("Y", "y$")
vmap("<leader>y", "\"+y<cr>")
nmap("<leader>p", "<cmd>read !xsel --clipboard --output<cr>")
nmap("<leader>c", "<cmd>w !xsel -ib<cr><cr>")
nmap("<up>", "<nop>")
nmap("<down>", "<nop>")
nmap("<left>", "<nop>")
nmap("<right>", "<nop>")

-- Search tools
map("<leader>," "<cmd>let @;/=''<cr>")
nmap("n", "nzz")
nmap("N", "Nzz")
nmap("*", "*zz")
nmap("#", "#zz")
nmap("*g", "g*zz")

-- Grep
nmap("<leader>g", "<cmd>grep -g !tags<space><C-r><C-w><cr><cmd>Qfix 0 0<cr><cr>")
nmap("<leader>r", "<cmd>grep<space>")
nmap("<leader>lg", "<cmd>lgrep -g !tags<space><C-r><C-w><cr><cmd>Qfix 0 0<cr><cr>")
nmap("<leader>lr", "<cmd>lgrep")
nmap("<leader>s", "<cmd>Rg")

-- Notes
nmap("<leader>ncd", "<cmd>cd $NOTES_DIR<cr")
nmap("<leader>ng", "<cmd>cd $NOTES_DIR<cr><cmd>Ngrep<space><C-r><C-w><cr><cmd>Qfix 1 0<cr><cr>")
nmap("<leader>nr", "<cmd>cd $NOTES_DIR<cr><cmd>Ngrep<space>")
nmap("<leader>ns", "<cmd>cd $NOTES_DIR<cr><cmd>Nf (^\|[[:space::]])@(\w\S*)<cr>")
nmap("<leader>nq", "<cmd>grep /\*\*Q\*\*/ %<cr>")
nmap("<leader>nn", "<cmd>NewNote")
nmap("<leader>nl", "<cmd>call fzf#run({'sink': 'HandleFZF', 'down': '25%'}) <cr>")
