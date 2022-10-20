-- aliases
local glo = vim.g
local fn = vim.fn
local os, _ = require('utils').get_os_name()

----------------------------------------------------
-- plugins installation
----------------------------------------------------
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  Packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

Packer = require('packer')
Packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}
Packer.startup(function(use)

  -- FUNCTIONS
  use 'wbthomason/packer.nvim'
  use 'skywind3000/asyncrun.vim'
  use 'zhimsel/vim-stay'

  -- IDE
  use { 'kyazdani42/nvim-tree.lua', requires = { 'kyazdani42/nvim-web-devicons', 'stevearc/dressing.nvim' } }
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use { 'nvim-telescope/telescope.nvim', requires = {'nvim-lua/plenary.nvim', 'kyazdani42/nvim-web-devicons'} }
  use 'nvim-telescope/telescope-media-files.nvim'
  use {"akinsho/toggleterm.nvim", tag = 'v2.*'}
  use 'tpope/vim-fugitive'
  use 'airblade/vim-gitgutter'
  use {'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim'}
  use 'habamax/vim-godot'
  use { "iamcco/markdown-preview.nvim", run = function() vim.fn["mkdp#util#install"]() end }

  -- NAVIGATION
  use 'christoomey/vim-tmux-navigator'
  use 'mbbill/undotree'
  use 'phaazon/hop.nvim'
  use 'karb94/neoscroll.nvim'
  use 'matze/vim-move'
  use 'wfxr/minimap.vim'
  use 'szw/vim-g'

  -- EDITING
  use 'tpope/vim-surround'
  use 'jiangmiao/auto-pairs'
  use 'KabbAmine/vCoolor.vim'
  use 'numToStr/Comment.nvim'
  use 'voldikss/vim-translator'
  use 'lewis6991/spellsitter.nvim'

  -- cosmetics
  use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } }
  use 'lukas-reineke/indent-blankline.nvim'
  use 'Mofiqul/dracula.nvim'
  use { "folke/todo-comments.nvim", requires = "nvim-lua/plenary.nvim" }
  use 'norcalli/nvim-colorizer.lua'

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'
  use "hrsh7th/nvim-cmp"
  use {"petertriho/cmp-git", requires = "nvim-lua/plenary.nvim"}
  use 'hrsh7th/cmp-nvim-lsp'
  use 'nvim-lua/lsp-status.nvim'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'f3fora/cmp-spell'
  use 'ray-x/lsp_signature.nvim'
  use 'github/copilot.vim'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use 'rafamadriz/friendly-snippets'
  use 'blitmap/lua-snippets'

  -- javascript
  use 'styled-components/vim-styled-components'

  -- OVER OBSERVATION
  use 'glepnir/dashboard-nvim'
  use { "brymer-meneses/grammar-guard.nvim", requires = { "neovim/nvim-lspconfig", "williamboman/nvim-lsp-installer"} }
  use { "barreiroleo/ltex-extra.nvim" }
  use { "kamykn/spelunker.vim", requires = { "kamykn/popup-menu.nvim" } }
  use { "preservim/vim-pencil" }
  use {
    "ThePrimeagen/refactoring.nvim",
    requires = {
        {"nvim-lua/plenary.nvim"},
        {"nvim-treesitter/nvim-treesitter"}
    }
  }
  use { 'mrshmllow/document-color.nvim', config = function()
      require("document-color").setup {
        -- Default options
        mode = "background", -- "background" | "foreground" | "single"
      }
    end
  }

  if Packer_bootstrap then
    Packer.sync()
  end
end)

----------------------------------------------------
-- plugins config
----------------------------------------------------
-- Copilot config
glo.copilot_node_command = '~/.nvm/versions/node/v16.15.0/bin/node'
glo.copilot_no_tab_map = true
glo.copilot_assume_mapped = true
glo.copilot_tab_fallback = ''

-- spelunker
glo.enable_spelunker_vim = 0

-- minimap config
glo.minimap_highlight_range = true

-- translation config
glo.translator_target_lang = 'english'

-- vim-g
if os ~= 'Mac' then
  glo.vim_g_open_command = "xdg-open"
end
glo.vim_g_python_command = "python3"
glo.vim_g_query_url = "https://duckduckgo.com/?q="

-- gitgutter
glo.gitgutter_enabled=1
glo.gitgutter_map_keys = 0
glo.gitgutter_sign_added = ' '
glo.gitgutter_sign_modified = '⚡'
glo.gitgutter_sign_removed = '嵐'
glo.gitgutter_sign_modified_removed = ' '

-- vim-move
glo.move_key_modifier = 'C'
glo.move_key_modifier_visualmode = 'C'

-- vim-tmux-navigator
glo.tmux_navigator_no_mappings = 1

-- auto-pairs-surround
glo.AutoPairsMultilineClose = 0

-- blanck-line
glo.indent_blankline_max_indent_increase = 2
glo.indent_blankline_use_treesitter = true
glo.indent_blankline_show_trailing_blankline_indent = false
glo.indent_blankline_show_end_of_line = false


-- dracula config
glo.dracula_italic_comment = true

require('dracula').setup({
  transparent_bg = true,
  italic_comments = true,
})

-- godot config
glo.godot_executable = '/Applications/Godot.app/Contents/MacOS/Godot'

require("indent_blankline").setup {
  space_char_blankline = " ",
  show_current_context = true,
}
require'nvim-treesitter.configs'.setup {
	ensure_installed = {"lua","python", "javascript", "markdown"},
	highlight = {
		enable = true,
		disable = {""},
	},
  indent = {
    enable = true
  }
}
require('Comment').setup()
require('refactoring').setup({})
require('todo-comments').setup {
	keywords = {
		BUG = { icon = " ", color = "error", alt = { "FIXME", "BUG", "ISSUE" }},
		TODO = { icon = " ", color = "info" },
		HACK = { icon = " ", color = "#f06caa" },
		WARN = { icon = " ", color = "#ffb86c", alt = { "WARNING", "XXX" } },
		PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
		NOTE = { icon = " ", color = "#9192ff", alt = { "INFO" } },
	},
}
require('telescope').load_extension('media_files')
require('telescope').setup{
  defaults = {
    prompt_prefix = "- 🐙 :",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    scroll_strategy = "cycle",
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰'},
    color_devicons = true,
    use_less = true,
    layout_strategy = "horizontal",
    layout_config = {
      width = 0.95,
      prompt_position = "bottom",
      preview_cutoff = 10,
    }
  },
  extensions = {
    media_files = {
      filetypes = {"png", "jpg", "jpeg", "svg", "ttf"},
    }
  }
}
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
  renderer = {
    indent_markers = {
      enable = true,
      icons = {
        corner = "└ ",
        edge = "│ ",
        none = "  ",
      },
    },
    icons = {
      webdev_colors = true,
      git_placement = "before",
      padding = " ",
      symlink_arrow = " ➛ ",
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
      },
      glyphs = {
        default = "",
        symlink = "",
        folder = {
          arrow_closed = "",
          arrow_open = "",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
        git = {
          unstaged = "✗",
          staged = "✓",
          unmerged = "",
          renamed = "➜",
          untracked = "★",
          deleted = "",
          ignored = "◌",
        },
      },
    },
  },
  diagnostics = {
    enable = false,
    show_on_dirs = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  actions = {
    use_system_clipboard = true,
  },
  filters = {
    dotfiles = true,
    custom = {},
    exclude = {},
  },
})
require'hop'.setup()
require('neoscroll').setup()
require('toggleterm').setup({
  start_in_insert = false
})
require('colorizer').setup()
require('lualine').setup({
  options = {
    theme = 'dracula'
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {
      {
        'filename',
        path = 1,
      }
    },
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
})
require('spellsitter').setup({
  enable = true,
})
require('dressing').setup({
  input = {
    enabled = true,
    border = "rounded",
    winblend = 10,
  }
})
require "lsp_signature".setup({
  bind= true,
  handler_opts= {
    border = "rounded"
  },
  hint_enable=false,
  transparency = 50,
  floating_window = false,
  toggle_key = '<M-f>',
})
require("luasnip/loaders/from_vscode").lazy_load()
local cmp = require('cmp')
local luasnip = require('luasnip')
local check_backspace = function()
  local col = vim.fn.col "." - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end
local kind_icons = {
  Text = "",
  Method = "m",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "",
  Interface = "",
  Module = "",
  Property = "",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = "",
}
cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp', group_index = 2 },
    { name = 'buffer', group_index = 2 },
    { name = 'path', group_index = 2 },
    { name = 'luasnip', group_index = 2 },
    { name = 'spell', group_index = 2 },
    { name = 'gitlint', group_index = 2 }
  }),
  sorting = {
    priority_weight = 2,
    comparators = {
      cmp.config.compare.offset,
      cmp.config.compare.score,
      cmp.config.compare.recently_used,
      cmp.config.compare.sort_text,
      cmp.config.compare.length,
      cmp.config.compare.order,
    },
  },
  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false
  },
  style = {
    winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
  },
  window = {
    fields = { "kind", "abbr", "menu" },
    completion = {
      border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
      scrollbar = "║",
      autocomplete = {
        require("cmp.types").cmp.TriggerEvent.InsertEnter,
        require("cmp.types").cmp.TriggerEvent.TextChanged,
      },
    },
    documentation = {
      border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
      scrollbar = "║",
    },
  },
  experimental = {
    ghost_text = true,
    native_menu = false,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<C-p>'] = cmp.mapping.confirm({ select = true }),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expandable() then
        luasnip.expand()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif check_backspace() then
        fallback()
      else
        fallback()
      end
    end, {"i","s"}),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, {"i","s"}),
  }),
  formatting = {
    format = function(entry, vim_item)
      -- Kind icons
      vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)
      vim_item.menu = ({
        luasnip = "[Snippet]",
        buffer = "[Buffer]",
        path = "[Path]",
        nvim_lsp = "[LSP]",
      })[entry.source.name]
      return vim_item
    end,
  },
})
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you installed it.
  }, {
    { name = 'buffer' },
  })
})
