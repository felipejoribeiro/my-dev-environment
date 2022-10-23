-- LSP configuration
-- Author: @felipejoribeiro

-- utils
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

local check_backspace = function()
  local col = vim.fn.col "." - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end


---------------------------------------------------------
--- Language server plugging configuration
---------------------------------------------------------
local has_cmp, cmp = pcall(require, 'cmp')
local has_luasnip, luasnip = pcall(require, 'luasnip')
if has_luasnip then
  require('luasnip/loaders/from_vscode').lazy_load()
end
if has_cmp then
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
      documentation = { border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }, scrollbar = "║" },
    },
    experimental = { ghost_text = false, native_menu = false },
    mapping = cmp.mapping.preset.insert({
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<M-e>'] = cmp.mapping.abort(),
      ['<M-p>'] = cmp.mapping.confirm({ select = true }),
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
      end, { "i", "s" }),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { "i", "s" }),
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
end

-- Mappings.
local home = os.getenv("HOME")

local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('n', '[g', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', ']g', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>Q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  -- Mappings.
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>aw', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

---------------------------------------------------------
--- Language server configuration
---------------------------------------------------------
vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = true,
  severity_sort = true,
})
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

---------------------------------------------------------
--- Initializing servers
---------------------------------------------------------
require("grammar-guard").init()
-- local eslint_config = require("lspconfig.server_configurations.eslint")
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
local nvim_lsp = require('lspconfig')
local lsp_servers = {
  'bashls', -- npm install -g bash-language-server
  'gdscript', -- install the godot editor https://github.com/habamax/vim-godot
  -- 'eslint', --npm install -g eslint~/.local~/.local/share/nvim/lsp_servers/ltex/share/nvim/lsp_servers/ltex
  -- 'tsserver', -- npm install -g typescript typescript-language-server
}

for _, lsp in ipairs(lsp_servers) do
  nvim_lsp[lsp].setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })
end

require('nvim-lsp-installer').on_server_ready(function(server)
  local opt = {}
  opt.on_attach = on_attach
  opt.capabilities = capabilities

  if server.name == "sumneko_lua" then
    opt.settings = {
      Lua = {
        runtime = {
          version = 'LuaJIT'
        },
        diagnostics = {
          globals = { 'vim', 'use' }
        }
      }
    }
  end

  if server.name == "ltex" then
    opt.settings = {
      ltex = {
        enabled = { "latex", "tex", "bib", "markdown" },
        language = "en-US",
        diagnosticSeverity = "information",
        setenceCacheSize = 2000,
        checkFrequency = "edit",
        trace = { server = "verbose" },
        additionalRules = {
          enablePickyRules = true,
          motherTongue = "pt-BR",
        },
      }
    }
    opt.on_attach = function(client, bufnr)
      require("ltex_extra").setup{
        load_langs = { "pt-BR", "en-US" }, -- table <string> : languages for witch dictionaries will be loaded
        init_check = true, -- boolean : whether to load dictionaries on startup
        path = home .. '/.config/nvim/grammar', -- string : path to store dictionaries. Relative path uses current working directory
        log_level = "debug", -- string : "none", "trace", "debug", "info", "warn", "error", "fatal"
      }
      on_attach(client, bufnr)
    end
  end

  if server.name == "tailwindcss" then
    opt.capabilities.textDocument.colorProvider = {
      dynamicRegistration = true
    }
  end

  server:setup(opt)
end)
