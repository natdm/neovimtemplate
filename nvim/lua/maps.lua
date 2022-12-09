local map = vim.api.nvim_set_keymap
local g = vim.g
local cmd = vim.cmd

-- helper functions These are made with some default settings. The names should indicate what they do pretty well.
-- [mode]map[(s)ilent?][(l)eader?]
-- eg: nmap("fjs", ":Prettier<CR>") will map `fjs` in normal mode to run `:Prettier`
-- eg: nmaps("fjs", ":Prettier<CR>") will do the same thing, but silently execute (not show `:Prettier` in the command pallete)
-- eg: nmapsl("fjs", ":Prettier<CR>") will run the comand but it has to be ran with <leader>. In this repo, the leader is space. So, <SPACE>fjs will run it.
-- Same for visual, insert mode, etc.
local function nmap(pattern, action)
	local options = {}
	map("n", pattern, action, options)
end

local function nmapsl(pattern, action)
	local options = { noremap = true, silent = true }
	map("n", "<leader>" .. pattern, action, options)
end

local function nmaps(pattern, action)
	local options = { noremap = true, silent = true }
	map("n", pattern, action, options)
end

local function nmapl(pattern, action)
	local options = { noremap = true }
	map("n", "<leader>" .. pattern, action, options)
end

local function imap(pattern, action)
	local options = { noremap = true }
	map("i", pattern, action, options)
end

local function vmap(pattern, action)
	local options = { noremap = true }
	map("v", pattern, action, options)
end

local function vmapsl(pattern, action)
	local options = { noremap = true, silent = true }
	map("v", "<leader>" .. pattern, action, options)
end

local function vmapl(pattern, action)
	local options = { noremap = true }
	map("v", "<leader>" .. pattern, action, options)
end
-- the next two lines are equivalent to these two:
-- nnoremap <SPACE> <Nop>
-- let mapleader=" "
nmap("<Space>", "")
g.mapleader = " "

-- activate easymotion
nmap("s", "<Plug>(easymotion-overwin-f)")

-- file explorer
nmapsl("e", ":NvimTreeToggle<CR>")
nmapsl("r", ":NvimTreeRefresh<CR>")

---- Window Splits
--Split the entire terminal window
nmapsl("wsh", ":topleft vnew<CR><ESC>")
nmapsl("wsj", ":botright new<CR><ESC>")
nmapsl("wsk", ":topleft new<CR><ESC>")
nmapsl("wsl", ":botright vnew<CR><ESC>")

-- buffer splits, eg: a segment of a window
nmapsl("bsh", ":leftabove vnew<CR><ESC>")
nmapsl("bsj", ":rightbelow new<CR><ESC>")
nmapsl("bsk", ":leftabove new<CR><ESC>")
nmapsl("bsl", ":rightbelow vnew<CR><ESC>")

-- Navigating splits is usually done with <C-w>{some split}. Skip the C-w.
nmaps("<C-h>", "<C-w><C-h>")
nmaps("<C-j>", "<C-w><C-j>")
nmaps("<C-k>", "<C-w><C-k>")
nmaps("<C-l>", "<C-w><C-l>")

-- copy the current buffer path
cmd("command! CopyBufferPath let @+ = expand('%:p')")
nmapsl("ybp", ":CopyBufferPath<CR>")
