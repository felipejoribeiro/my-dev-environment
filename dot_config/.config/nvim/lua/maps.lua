-- All global mappings for my nvim config
-- Author: @felipejoribeiro

-- Functional wrapper for mapping custom keybindings
local map = function(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end
local buf_map = function(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_buf_set_keymap(0, mode, lhs, rhs, options)
end

-- map the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- mappings
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>")
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>")
map("n", "<leader>fi", "<cmd>Telescope media_files <CR>")
map("n", "<leader>ft", "<cmd>TodoTelescope <CR>")
map("n", "<leader>u", "<cmd>UndotreeToggle<CR>")
map("n", "<leader>e", "<cmd>NvimTreeFindFileToggle<CR>")
map("n", "<leader>m", "<cmd>MinimapToggle<CR>")
map('n', '<leader>h', "<cmd>HopChar2<CR>")
map('n', '<leader>H', "<cmd>HopChar1<CR>")
map("n", "<Leader>w", "<cmd>TranslateW --engines=google --target_lang=pt<CR>", { silent = true })
map("n", "<Leader>W", "<cmd>TranslateW --engines=google --target_lang=en<CR>", { silent = true })
map("v", "<Leader>w", ":'<,'>TranslateW --engines=google --target_lang=pt<CR>", { silent = true })
map("v", "<Leader>W", ":'<,'>TranslateW --engines=google --target_lang=en<CR>", { silent = true })
map("v", "<leader>s", ":Google<CR>")
map("n", "<leader>s", ":Google<CR>")
map('n', '<leader>gs', '<cmd>G<CR>')
map('n', '<leader>gb', '<cmd>Git blame<CR>')

-- General life enhancements
map("i", "jj", "<esc>")
map("n", "c", '"_c')     -- doesn't override ctrl-c
map("v", "c", '"_c')     -- doesn't override ctrl-c
map("n", "<leader>R", '<cmd>tabe $MYVIMRC<CR>')
map("n", "<leader>q", '<cmd>qa!<CR>')

-- keep screen centralized when jumping
map("n", "n", 'nzzzv')
map("n", "N", 'Nzzzv')
map("n", "J", 'mzJ`z')

-- better undo when writing prose
map("i", ",", ',<c-g>u')
map("i", ".", '.<c-g>u')
map("i", "!", '!<c-g>u')
map("i", "?", '?<c-g>u')

-- Alt movements
map("i", "<A-o>", "copilot#Accept('')", {expr=true, silent = true})
map("n", "<A-J>", "<C-w>-")
map("n", "<A-K>", "<C-w>+")
map("n", "<A-L>", "<C-w>>")
map("n", "<A-H>", "<C-w><")
map("n", "<A-j>", "<cmd>TmuxNavigateDown<CR>", { silent = true })
map("n", "<A-k>", "<cmd>TmuxNavigateUp<CR>", { silent = true })
map("n", "<A-l>", "<cmd>TmuxNavigateRight<CR>", { silent = true })
map("n", "<A-h>", "<cmd>TmuxNavigateLeft<CR>", { silent = true })

-- toogle search highlight
map("n", "<leader>/", ":set hlsearch!<CR>")

-- toogle relative line numbers
map("n", "<leader>n", "<cmd>set relativenumber!<CR>")

-- Remaps for the refactoring operations currently offered by the plugin
vim.api.nvim_set_keymap("v", "<leader>re", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]], {noremap = true, silent = true, expr = false})
vim.api.nvim_set_keymap("v", "<leader>rf", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>]], {noremap = true, silent = true, expr = false})
vim.api.nvim_set_keymap("v", "<leader>rv", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]], {noremap = true, silent = true, expr = false})
vim.api.nvim_set_keymap("v", "<leader>ri", [[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]], {noremap = true, silent = true, expr = false})

-- Extract block doesn't need visual mode
vim.api.nvim_set_keymap("n", "<leader>rb", [[ <Cmd>lua require('refactoring').refactor('Extract Block')<CR>]], {noremap = true, silent = true, expr = false})
vim.api.nvim_set_keymap("n", "<leader>rbf", [[ <Cmd>lua require('refactoring').refactor('Extract Block To File')<CR>]], {noremap = true, silent = true, expr = false})

-- File type dependent commands
local function file_type_commands()
  local ft = vim.bo.filetype
  if ft == "markdown" then
    buf_map("n", "<leader>j", "<cmd>MarkdownPreviewToggle<CR>", {noremap = true, silent = true})
  end
end
vim.api.nvim_create_autocmd("FileType", { callback = file_type_commands })

-- comments:
-- gco, gcO, gcA, gcc, gbc

-- info:
-- to turn everything into tabs ==> :%s/  /\t/g
-- to turn everything into tabs ==> set noet ci pi sts=0 sw=2 ts=2
