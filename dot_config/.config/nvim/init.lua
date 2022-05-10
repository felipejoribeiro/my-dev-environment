-- source old Config

-- aliases
local opt = vim.opt

-- global configuration
opt.termguicolors = true                           -- force gui colors
opt.fileformat = "unix"                            -- set file format
opt.clipboard = vim.o.clipboard .. "unnamedplus"   -- use system's clipboard
opt.shortmess = vim.o.shortmess .. "c"             -- don't print short messages
opt.mouse = "a"                                    -- enable mouse support
opt.completeopt="menu,menuone,noselect"            -- complete options

opt.undofile = true                                -- persistent undo
opt.undodir = vim.env.HOME .. '/.config/nvim/undodir' -- where to save undo
opt.viewoptions = 'folds,cursor,curdir,slash,unix' -- for save state
opt.backup = false                                 -- disable backup files
opt.writebackup = false                            -- prevents writing backup
opt.swapfile = false                               -- disable swap file creation

opt.ignorecase = true                              -- ignore case in search
opt.smartcase = true                               -- smartly ignore case

opt.showcmd = false                                -- don't show key pressed
opt.number = true                                  -- create number column
opt.wrap = false                                   -- disable line wrap by default
opt.scrolloff = 1                                  -- make the cursor stay in center
opt.sidescrolloff = 4                              -- make cursor stay in center

opt.cmdheight = 1                                  -- number of lines for commands
opt.title = true                                   -- set window title
opt.splitbelow = true                              -- default split behaviour
opt.spell = true                                   -- enable spell
opt.spelllang = 'en,pt,cjk'                        -- spell languages

opt.ttimeout = true                                -- makes things faster
opt.updatetime = 300                               -- faster completion
opt.timeoutlen = 400                               -- by default 1000ms
opt.ttimeoutlen = 80                               -- makes things faster

opt.tabstop = 2                                    -- number of spaces in tab
opt.shiftwidth = 2                                 -- size of indentation
opt.expandtab = true                               -- make tabs become spaces

-- loading configs
require('plugins')
require('lsp')
require('maps')

-- cosmetics
vim.cmd('colorscheme dracula')       -- set colorscheme
vim.api.nvim_exec(
[[
  hi Visual term=reverse cterm=reverse guibg=#595CA8
  hi GitGutterDelete guibg=NONE ctermbg=NONE guifg=#FF4877
  au BufEnter * hi GitGutterDelete guibg=NONE ctermbg=NONE guifg=#FF4877
  hi TranslatorBorder guibg=NONE ctermbg=NONE guifg=white
  hi clear Todo
  hi Normal guibg=NONE ctermbg=NONE
]], false)