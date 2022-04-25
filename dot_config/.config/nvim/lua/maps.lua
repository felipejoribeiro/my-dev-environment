-- Functional wrapper for mapping custom keybindings
local map = function(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
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
map('n', '<leader>h', "<cmd>HopChar1<CR>")
map("n", "<Leader>w", "<cmd>TranslateW --engines=google --target_lang=pt<CR>", { silent = true })
map("v", "<Leader>w", "<cmd>TranslateW --engines=google --target_lang=pt<CR>", { silent = true })
map("n", "<Leader>W", "<cmd>TranslateW --engines=google --target_lang=en<CR>", { silent = true })
map("v", "<Leader>W", "<cmd>TranslateW --engines=google --target_lang=en<CR>", { silent = true })
map("v", "<leader>s", ":Google<CR>")
map("n", "<leader>s", ":Google<CR>")
map('n', '<leader>gl', '<cmd>diffget //3<CR>')
map('n', '<leader>gh', '<cmd>diffget //2<CR>')
map('n', '<leader>gs', '<cmd>G<CR>')
map('n', '<leader>gB', '<cmd>Git blame<CR>')

-- General life enhancements
map("i", "jj", "<esc>")
map("n", "c", '"_c')
map("v", "c", '"_c')
map("n", "<leader>r", '<cmd>tabe $MYVIMRC<CR>')

-- Hide search highlight
vim.api.nvim_exec(
[[
  let hlstate=0
  nnoremap <silent> <leader>/ :if (hlstate%2 == 0) \| nohlsearch \| else \| set hlsearch \| endif \| let hlstate=hlstate+1<cr><cr>k
]], false)

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
map("n", "<A-J>", "<C-w>-")
map("n", "<A-K>", "<C-w>+")
map("n", "<A-L>", "<C-w>>")
map("n", "<A-H>", "<C-w><")
map("n", "<A-j>", "<cmd>TmuxNavigateDown<CR>", { silent = true })
map("n", "<A-k>", "<cmd>TmuxNavigateUp<CR>", { silent = true })
map("n", "<A-l>", "<cmd>TmuxNavigateRight<CR>", { silent = true })
map("n", "<A-h>", "<cmd>TmuxNavigateLeft<CR>", { silent = true })

-- Terminal maps
map('n', '<leader>t', '<cmd>ToggleTerm<CR>', { silent = true })
map('n', '<leader>ts', '<cmd>ToggleTermSendVisualLines<CR>', { silent = true })
map('n', '<leader>T', '<cmd>ToggleTermToggleAll<CR>', { silent = true })
function _G.set_terminal()
  local opts = {noremap = true}
  vim.api.nvim_buf_set_keymap(0, 't', '<esc><esc>', [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', 'jk', [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
  vim.wo.spell = false
end
vim.cmd('autocmd! TermOpen term://* lua set_terminal()')

-- comments:
-- gco, gcO, gcA, gcc, gbc


-- info:
-- to turn everything into tabs ==> :%s/  /\t/g
-- to turn everything into tabs ==> set noet ci pi sts=0 sw=2 ts=2


