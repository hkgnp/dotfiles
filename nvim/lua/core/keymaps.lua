-----------------------------------------------------------
-- Define keymaps of Neovim and installed plugins.
-----------------------------------------------------------

local function map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Change leader to a comma
vim.g.mapleader = " "

-----------------------------------------------------------
-- Neovim shortcuts
-----------------------------------------------------------
-- Disable arrow keys
map("", "<up>", "<nop>")
map("", "<down>", "<nop>")
map("", "<left>", "<nop>")
map("", "<right>", "<nop>")

-- Clear search highlighting with <leader> and c
map("n", "<esc>", ":noh<CR>")

-- Toggle auto-indenting for code paste
map("n", "<F2>", ":set invpaste paste?<CR>")
vim.opt.pastetoggle = "<F2>"

-- Change split orientation
map("n", "<leader>tk", "<C-w>t<C-w>K") -- change vertical to horizontal
map("n", "<leader>th", "<C-w>t<C-w>H") -- change horizontal to vertical

-- Reload configuration without restart nvim
map("n", "<leader>R", ":luafile %<CR>")

-- Fast saving
map("n", ";;", ":wall<CR>:e<CR>")

-- Quit
map("n", "<leader>q", ":q<CR>:call DWM_Rotate(0)<CR>:call DWM_Rotate(1)<CR>")

-- Close all windows and exit from Neovim with <leader> and q
map("n", "<leader>Q", ":qa!<CR>")

-- Replaces word under the cursor. First, change the word, then just press '.' to change subsequent words
map("n", "<leader>x", "hy:%s/<C-r><C-w>//gc<left><left><left>")
map("v", "<C-r>", "hy:%s/<C-R>h//gc<left><left><left>")

-- Abbrev
vim.cmd.inoreabbrev({
	"clog",
	"console.log()<Esc>ha",
})

-----------------------------------------------------------
-- Applications and Plugins shortcuts
-----------------------------------------------------------

-- Yarn build
map("n", "<leader>B", ":!yarn run build<CR>")

-- Git tag
map("n", "<leader>G", ":!gittag<CR>")

-- Terminal mappings
map("n", "<C-T>", ":ToggleTerm<CR>", { noremap = true }) -- open
map("t", "<Esc>", "<C-\\><C-n>:q<CR>") -- exit

-- NvimTree
map("n", "<C-n>", ":NvimTreeToggle<CR>") -- open/close

-- Tagbar
map("n", "<leader>z", ":TagbarToggle<CR>") -- open/close

-- DWM
map("n", "<C-l>", ":call DWM_Rotate(0)<CR>")
map("n", "<C-h>", ":call DWM_Rotate(1)<CR>")

-- Telescope
map(
	"n",
	"vcp",
	"<cmd>lua require('telescope.builtin').find_files({prompt_title='< Code Projects >', cwd='~/Code_Projects'})<cr>"
)
map(
	"n",
	"vrc",
	"<cmd>lua require('telescope.builtin').find_files({prompt_title='< VimRC >', cwd='~/.config/nvim'})<cr>"
)

-- Dadbod
map("n", "<leader>du", "<Cmd>DBUIToggle<Cr>")
map("n", "<leader>df", "<Cmd>DBUIFindBuffer<Cr>")
map("n", "<leader>dr", "<Cmd>DBUIRenameBuffer<Cr>")
map("n", "<leader>dq", "<Cmd>DBUILastQueryInfo<Cr>")

-----------------------------------------------------------
-- From Primeagen
-----------------------------------------------------------
-- Replaces word under the cursor. First, change the word, then press '.' to change subsequent words
-- map('n', '<leader>x', "/\<<C-R>=expand('<cword>')<CR>\>\C<CR>``cgn")

-- Change x so it doesn't save deleted character to history
map("n", "x", '"_dl')

-- Find and replace text in visual mode
map("v", "<C-r>", '"hy:%s/<C-r>h//gc<left><left><left>')

-- Make Y behave like D or C
map("n", "Y", "y$")

-- Keeping it centered
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("n", "J", "mzJ`z")

-- Move to beginning or end of line without taking fingers off home row
map("n", "H", "^")
map("n", "L", "$")

-- Moving text
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")
map("i", "<C-j>", "<esc>:m .+1<CR>==")
map("i", "<C-k>", "<esc>:m .-2<CR>==")
map("n", "<leader>j", ":m .+1<CR>==")
map("n", "<leader>k", ":m .-2<CR>==")
