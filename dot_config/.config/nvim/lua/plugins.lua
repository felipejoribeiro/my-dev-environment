-- pluggins configuration
-- Author: @felipejoribeiro

local glo = vim.g
local fn = vim.fn
local os, _ = require('utils').get_os_name()

----------------------------------------------------
-- plugins configuration
----------------------------------------------------
local dashboardSetup = function ()
end

local nvimTreesitterSetup = function()
  require 'nvim-treesitter.configs'.setup {
    ensure_installed = { "lua", "python", "javascript", "markdown" },
    highlight = {
      enable = true,
      disable = { "" },
    },
    indent = {
      enable = true
    }
  }
end

local draculaSetup = function()
  glo.dracula_italic_comment = true
  require('dracula').setup({
    transparent_bg = true,
    italic_comments = true,
  })
end

local indentBlankLineSetup = function()
  glo.indent_blankline_char = '▏'
  glo.indent_blankline_filetype_exclude = { 'help', 'terminal', 'dashboard' }
  glo.indent_blankline_buftype_exclude = { 'terminal' }
  glo.indent_blankline_max_indent_increase = 2
  glo.indent_blankline_use_treesitter = true
  glo.indent_blankline_show_trailing_blankline_indent = false
  glo.indent_blankline_show_end_of_line = false
  glo.indent_blankline_show_first_indent_level = true
  require("indent_blankline").setup {
    space_char_blankline = " ",
    show_current_context = true,
  }
end

local luaLineSetup = function()
  require('lualine').setup({
    options = {
      theme = 'dracula',
      always_divide_middle = true,
      ignore_filetypes = { 'dashboard', 'NvimTree', 'help' },
      ignore_focus = { 'dashboard', 'NvimTree', 'help' },
    },
    sections = {
      lualine_a = { 'mode' },
      lualine_b = {
        {
          'branch',
          fmt = function(branch)
            -- get size of the current buffer
            local size = vim.fn.line('$')
            if size < 50 then
              if #branch > 15 then
                return string.sub(branch, 1, 15) .. '...'
              end
            end
            return branch
          end,
        },
        'diff',
        'diagnostics'
      },
      lualine_c = { { 'filename', path = 1 } },
      lualine_x = { 'encoding', 'fileformat', 'filetype' },
      lualine_y = { 'progress' },
      lualine_z = { 'location' }
    },
  })
end

local todoCommentsSetup = function()
  require('todo-comments').setup {
    keywords = {
      BUG = { icon = " ", color = "error", alt = { "FIXME", "BUG", "ISSUE" } },
      TODO = { icon = " ", color = "info" },
      HACK = { icon = " ", color = "#f06caa" },
      WARN = { icon = " ", color = "#ffb86c", alt = { "WARNING", "XXX" } },
      PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
      NOTE = { icon = " ", color = "#9192ff", alt = { "INFO" } },
    },
  }
end

local nvimColorizerSetup = function()
  require('colorizer').setup()
end

local nvimWebDevIconsSetup = function()
  require('nvim-web-devicons').setup()
  require('nvim-web-devicons').setup {
    override = {
      zsh = {
        icon = "",
        color = "#428850",
        cterm_color = "65",
        name = "Zsh"
      }
    };
    color_icons = true;
    default = true;
  }
end

local dressingSetup = function ()
  require('dressing').setup({
    input = {
      enabled = true,
      border = "rounded",
      winblend = 10,
    }
  })
end

local nvimSurroundSetup = function()
  require("nvim-surround").setup()
end

local autoPairsSetup = function()
  glo.AutoPairsFlyMode = 1
  glo.AutoPairsShortcutBackInsert = '<M-b>'
  glo.AutoPairsShortcutToggle = '<M-P>'
  glo.AutoPairsMultilineClose = 1
end

local commentNvimSetup = function()
  require('Comment').setup()
end

local vimTranslatorSetup = function()
  glo.translator_target_lang = 'english'
end

local nvimTreeSetup = function()
  require('nvim-tree').setup({
    auto_reload_on_write = true,
    view = {
      mappings = {
        custom_only = false,
        list = {
          { key = "t", action = "tabnew" },
          { key = "l", action = "edit" },
          { key = "h", action = "close_node" },
        },
      },
    },
    diagnostics = { enable = false },
    actions = { use_system_clipboard = true },
    filters = {
      dotfiles = true,
      custom = {},
      exclude = {},
    },
  })
end

local telescopeSetup = function()
  require('telescope').setup({
    defaults = {
      prompt_prefix = "- 🐙 :",
      initial_mode = "insert",
      selection_strategy = "reset",
      sorting_strategy = "descending",
      scroll_strategy = "cycle",
      borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
      color_devicons = true,
      use_less = true,
      layout_strategy = "horizontal",
      layout_config = {
        width = 0.95,
        prompt_position = "bottom",
        preview_cutoff = 10,
      }
    }
  })
end

local vimGitGutterSetup = function()
  glo.gitgutter_enabled = 1
  glo.gitgutter_map_keys = 0
  glo.gitgutter_sign_added = ' '
  glo.gitgutter_sign_modified = '⚡'
  glo.gitgutter_sign_removed = '嵐'
  glo.gitgutter_sign_modified_removed = ' '
end

local vimCopilotSetup = function()
  glo.copilot_node_command = '~/.nvm/versions/node/v16.15.0/bin/node'
  glo.copilot_no_tab_map = true
  glo.copilot_assume_mapped = true
  glo.copilot_tab_fallback = ''
end

local vimTmuxNavigationSetup = function()
  glo.tmux_navigator_no_mappings = 1
end

local hopSetup = function()
  require('hop').setup()
end

local neoscrollSetup = function()
  require('neoscroll').setup()
end

local vimMoveSetup = function()
  glo.move_key_modifier = 'C'
  glo.move_key_modifier_visualmode = 'C'
end

local minimapSetup = function ()
  glo.minimap_highlight_range = true
end

local vimGSetup = function ()
  if os ~= 'Mac' then
    glo.vim_g_open_command = "xdg-open"
  end
  glo.vim_g_python_command = "python3"
  glo.vim_g_query_url = "https://duckduckgo.com/?q="
end

local vimGodotSetup = function ()
  glo.godot_executable = "/Applications/Godot.app/Contents/MacOS/Godot"
end

local neotestSetup = function ()
  require('neotest').setup({
    adapters = {
      require('neotest-jest')({
        jestCommand = "npm test --",
        jestConfigFile = "custom.jest.config.ts",
        env = { CI = true },
        cwd = function()
          return vim.fn.getcwd()
        end,
      }),
    },
    icons = {
      child_indent = "│",
      child_prefix = "├",
      collapsed = "─",
      expanded = "╮",
      failed = "ﮗ",
      final_child_indent = " ",
      final_child_prefix = "╰",
      non_collapsible = "─",
      passed = "",
      running = "ﯦ",
      running_animated = { "/", "|", "\\", "-", "/", "|", "\\", "-" },
      skipped = "ﮮ",
      unknown = "?"
    },
  })
end

----------------------------------------------------
-- plugins installation
----------------------------------------------------
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  Packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
end

Packer = require('packer')
Packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

----------------------------------------------------
-- plugins installation
----------------------------------------------------
Packer.startup(function(use)

  -- INTERNALS
  use { 'wbthomason/packer.nvim' }
  use { 'skywind3000/asyncrun.vim' }
  use { 'zhimsel/vim-stay' }

  -- COSMETICS
  use { 'glepnir/dashboard-nvim', config = dashboardSetup() }
  use { 'nvim-treesitter/nvim-treesitter', config = nvimTreesitterSetup(), run = ':TSUpdate' }
  use { 'Mofiqul/dracula.nvim', config = draculaSetup() }
  use { 'lukas-reineke/indent-blankline.nvim', config = indentBlankLineSetup() }
  use { 'nvim-lualine/lualine.nvim', config = luaLineSetup(), requires = { 'kyazdani42/nvim-web-devicons', opt = true } }
  use { 'folke/todo-comments.nvim', config = todoCommentsSetup(), requires = 'nvim-lua/plenary.nvim' }
  use { 'norcalli/nvim-colorizer.lua', config = nvimColorizerSetup() }
  use { 'nvim-tree/nvim-web-devicons', config = nvimWebDevIconsSetup() }
  use { 'stevearc/dressing.nvim', config = dressingSetup() }

  -- EDITING TOOLS
  use { 'kylechui/nvim-surround', config = nvimSurroundSetup(), tag = "*" }
  use { 'jiangmiao/auto-pairs', config = autoPairsSetup() }
  use { 'tpope/vim-repeat' }
  use { 'KabbAmine/vCoolor.vim' }
  use { 'numToStr/Comment.nvim', config = commentNvimSetup() }
  use { 'voldikss/vim-translator', config = vimTranslatorSetup() }
  use { 'mbbill/undotree' }

  -- FILE MANAGEMENT
  use { 'kyazdani42/nvim-tree.lua', config = nvimTreeSetup(), requires = { 'kyazdani42/nvim-web-devicons' } }
  use { 'nvim-telescope/telescope.nvim', config = telescopeSetup(), requires = { 'nvim-lua/plenary.nvim', 'kyazdani42/nvim-web-devicons' } }

  -- NAVIGATION
  use { 'christoomey/vim-tmux-navigator', config = vimTmuxNavigationSetup() }
  use { 'phaazon/hop.nvim', config = hopSetup() }
  use { 'karb94/neoscroll.nvim', config = neoscrollSetup() }
  use { 'matze/vim-move', config = vimMoveSetup() }
  use { 'wfxr/minimap.vim', config = minimapSetup() }
  use { 'szw/vim-g', config = vimGSetup() }

  -- GIT
  use { 'tpope/vim-fugitive' }
  use { 'airblade/vim-gitgutter', config = vimGitGutterSetup() }
  use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }

  -- COPILOT
  use { 'github/copilot.vim', config = vimCopilotSetup() }

  -- SNIPPETS
  use { 'L3MON4D3/LuaSnip', tag = 'v<CurrentMajor>.*' }
  use { 'rafamadriz/friendly-snippets' }
  use { 'blitmap/lua-snippets' }

  -- LANGUAGE SPECIFIC
  use { 'habamax/vim-godot', config = vimGodotSetup() }
  use { 'iamcco/markdown-preview.nvim', run = function() vim.fn['mkdp#util#install']() end }
  use { 'styled-components/vim-styled-components' }


  -- DEBUGGING
  use { "nvim-neotest/neotest", config = neotestSetup(), requires = { "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter", "antoinemadec/FixCursorHold.nvim", 'haydenmeade/neotest-jest' } }

  -- LSP (CONFIG IN DADICATED FILE LSP)
  use { 'neovim/nvim-lspconfig' }
  use { 'williamboman/nvim-lsp-installer' }
  use { 'hrsh7th/nvim-cmp' }
  use { 'hrsh7th/cmp-nvim-lsp' }
  use { 'hrsh7th/cmp-buffer' }
  use { 'hrsh7th/cmp-path' }
  use { 'hrsh7th/cmp-cmdline' }
  use { 'f3fora/cmp-spell' }
  use { 'petertriho/cmp-git', requires = 'nvim-lua/plenary.nvim' }
  use { 'saadparwaiz1/cmp_luasnip' }

  -- OVER OBSERVATION
  use { 'nvim-lua/lsp-status.nvim' }
  use { 'ray-x/lsp_signature.nvim' }
  use { 'brymer-meneses/grammar-guard.nvim', requires = { 'neovim/nvim-lspconfig', 'williamboman/nvim-lsp-installer' } }
  use { 'barreiroleo/ltex-extra.nvim' }
  use { 'kamykn/spelunker.vim', requires = { 'kamykn/popup-menu.nvim' } }
  use { 'preservim/vim-pencil' }
  use { 'ThePrimeagen/refactoring.nvim', requires = { { 'nvim-lua/plenary.nvim' }, { 'nvim-treesitter/nvim-treesitter' } } }

  if Packer_bootstrap then
    Packer.sync()
  end
end)

----------------------------------------------------
-- OVER OBSERVATION configs
----------------------------------------------------
-- spelunker
glo.enable_spelunker_vim = 0

-- refactoring
require('refactoring').setup({})

-- lsp signature
require "lsp_signature".setup({
  bind = true,
  handler_opts = {
    border = "rounded"
  },
  hint_enable = false,
  transparency = 50,
  floating_window = false,
  toggle_key = '<M-f>',
})
